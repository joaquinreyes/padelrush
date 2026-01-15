part of 'open_match_detail.dart';

final _isJoined = StateProvider<bool>((ref) => false);
final _inWaitingList = StateProvider<bool>((ref) => false);

// Settings tab providers
final _selectedTabIndexProvider = StateProvider<int>((ref) => 0);
final _approveBeforeJoinProvider = StateProvider<bool>((ref) => false);
final _isFriendlyMatchProvider = StateProvider<bool>((ref) => true);
final _minLevelProvider = StateProvider<double>((ref) => 0);
final _maxLevelProvider = StateProvider<double>((ref) => 7);
