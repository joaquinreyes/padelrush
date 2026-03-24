import 'dart:convert';

import 'package:padelrush/models/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_pref_manager.g.dart';

@Riverpod(keepAlive: true)
SharedPrefManager sharedPrefManager(SharedPrefManagerRef ref) {
  throw UnimplementedError();
}

class SharedPrefManager {
  static const String prefix = 'smash_padel`';
  static const String userKey = "${prefix}_user";
  static const String sportsName = "${prefix}_sport_name";
  static const String isSkip = "${prefix}_skip";
  static const String profilePictureDialogShown = "${prefix}_profile_dialog_shown";

  SharedPreferences prefs;
  SharedPrefManager(this.prefs);

  saveUser(AppUser user) async {
    await prefs.setString(userKey, jsonEncode(user.toJson()));
  }

  AppUser? fetchUser() {
    String? encodedString = prefs.getString(userKey);

    return encodedString != null
        ? AppUser.fromJson(jsonDecode(encodedString))
        : null;
  }

  setSportName(String sport) async {
    await prefs.setString(sportsName, sport);
  }

  getSportName() {
    return prefs.getString(sportsName);
  }

  setSkip(bool skip) async {
    await prefs.setBool(isSkip, skip);
  }

  bool getSkip() {
    return prefs.getBool(isSkip) ?? false;
  }

  setProfilePictureDialogShown(bool shown) async {
    await prefs.setBool(profilePictureDialogShown, shown);
  }

  bool hasProfilePictureDialogShown() {
    return prefs.getBool(profilePictureDialogShown) ?? false;
  }

  clearUser() async {
    await prefs.remove(userKey);
  }

  static String _waitingApprovalKey(int serviceId, int userId) =>
      "${prefix}_waiting_approval_${serviceId}_$userId";

  setWaitingApproval(int serviceId, int userId) async {
    await prefs.setBool(_waitingApprovalKey(serviceId, userId), true);
  }

  bool getWaitingApproval(int serviceId, int userId) {
    return prefs.getBool(_waitingApprovalKey(serviceId, userId)) ?? false;
  }

  clearWaitingApproval(int serviceId, int userId) async {
    await prefs.remove(_waitingApprovalKey(serviceId, userId));
  }
}
