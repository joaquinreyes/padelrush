import 'lesson_model_new.dart';

class CoachListModel {
  int? id;
  String? fullName;
  String? profileUrl;
  bool? profileVisible;
  int? bookableDays;
  String? description;
  int? positionList;
  int? minimumBookTime;
  List<LocationLesson>? location;
  List<Sport>? sports;

  /// Returns comma-separated list of sport names (e.g., "Padel, Pickleball")
  String get sportNames {
    if (sports == null || sports!.isEmpty) return '';
    return sports!.map((s) => s.sportName ?? '').where((s) => s.isNotEmpty).join(', ');
  }

  CoachListModel(
      {this.id,
        this.fullName,
        this.profileUrl,
        this.profileVisible,
        this.bookableDays,
        this.description,
        this.positionList,
        this.location,
        this.minimumBookTime,
        this.sports});

  CoachListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profileUrl = json['profile_url'];
    profileVisible = json['profile_visible'];
    bookableDays = json['bookable_days'];
    description = json['description'];
    positionList = json['position_list'];
    minimumBookTime = json['minimum_book_time'];
    if (json['location'] != null) {
      location = <LocationLesson>[];
      json['location'].forEach((v) {
        location!.add(LocationLesson.fromJson(v));
      });
    }
    if (json['sport'] != null) {
      sports = <Sport>[];
      json['sport'].forEach((v) {
        sports!.add(Sport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['profile_url'] = profileUrl;
    data['profile_visible'] = profileVisible;
    data['bookable_days'] = bookableDays;
    data['description'] = description;
    data['position_list'] = positionList;
    data['minimum_book_time'] = minimumBookTime;
    if (location != null) {
      data['location'] = location!.map((v) => v.toJson()).toList();
    }
    if (sports != null) {
      data['sport'] = sports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
