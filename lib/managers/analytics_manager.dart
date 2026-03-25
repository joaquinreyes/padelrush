import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/managers/api_manager.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_manager.g.dart';

@Riverpod(keepAlive: true)
AnalyticsManager analyticsManager(Ref ref) {
  final manager = AnalyticsManager(ref);
  ref.onDispose(() => manager.dispose());
  return manager;
}

String _generateSessionId() {
  final random = Random();
  final timestamp = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
  final randomPart = List.generate(8, (_) => random.nextInt(36).toRadixString(36)).join();
  return '$timestamp-$randomPart';
}

class AnalyticsManager with WidgetsBindingObserver {
  static const int _maxBufferSize = 20;
  static const Duration _flushInterval = Duration(seconds: 30);
  static const String _analyticsUrl = '$kBaseURL/$kClubID/analytics/events';

  final Ref _ref;
  final List<Map<String, dynamic>> _buffer = [];
  Timer? _flushTimer;
  String _sessionId = _generateSessionId();
  bool _initialized = false;
  String? _platform;

  AnalyticsManager(this._ref);

  void initialize() {
    if (_initialized) return;
    _initialized = true;
    _platform = _detectPlatform();
    WidgetsBinding.instance.addObserver(this);
    _startFlushTimer();
    _trackSessionStart();
  }

  void dispose() {
    _flushTimer?.cancel();
    _trackSessionEnd();
    _flush();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _sessionId = _generateSessionId();
        _trackSessionStart();
        _startFlushTimer();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _trackSessionEnd();
        _flush();
        _flushTimer?.cancel();
        break;
      default:
        break;
    }
  }

  void trackScreenView(String screenName) {
    _addEvent('screen_view', screenName);
  }

  void trackFeatureUse(String featureName, {Map<String, dynamic>? data}) {
    _addEvent('feature_use', featureName, eventData: data);
  }

  void _trackSessionStart() {
    _addEvent('session_start', 'session_start');
  }

  void _trackSessionEnd() {
    _addEvent('session_end', 'session_end');
  }

  String _detectPlatform() {
    if (kIsWeb) return 'web';
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) return 'ios';
      if (defaultTargetPlatform == TargetPlatform.android) return 'android';
    } catch (_) {}
    return 'unknown';
  }

  void _addEvent(String eventType, String eventName,
      {Map<String, dynamic>? eventData}) {
    _buffer.add({
      'session_id': _sessionId,
      'event_type': eventType,
      'event_name': eventName,
      'platform': _platform ?? 'unknown',
      'app_version': '1.0.0',
      if (eventData != null) 'event_data': eventData,
    });

    if (_buffer.length >= _maxBufferSize) {
      _flush();
    }
  }

  void _startFlushTimer() {
    _flushTimer?.cancel();
    _flushTimer = Timer.periodic(_flushInterval, (_) => _flush());
  }

  Future<void> _flush() async {
    if (_buffer.isEmpty) return;

    final events = List<Map<String, dynamic>>.from(_buffer);
    _buffer.clear();

    try {
      final token =
          _ref.read(userManagerProvider).user?.accessToken ?? '';
      final headers = <String, String>{
        'Content-Type': 'application/json',
        if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      };

      await http.post(
        Uri.parse(_analyticsUrl),
        headers: headers,
        body: jsonEncode({'events': events}),
      );
    } catch (e) {
      myPrint('Analytics flush error: $e');
    }
  }
}

class AnalyticsRouteObserver extends NavigatorObserver {
  final Ref ref;

  AnalyticsRouteObserver(this.ref);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _trackRoute(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _trackRoute(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) _trackRoute(previousRoute);
  }

  void _trackRoute(Route<dynamic> route) {
    final name = route.settings.name;
    if (name != null && name.isNotEmpty) {
      ref.read(analyticsManagerProvider).trackScreenView(name);
    }
  }
}
