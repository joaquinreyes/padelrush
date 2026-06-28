import '../globals/constants.dart';
import 'active_memberships.dart';
import 'membership_list_category_model.dart';
import 'membership_model.dart';

class UserActiveMembership {
  List<ActiveMemberships> activeMembership = [];
  List<MembershipModel> membershipModel = [];
  List<MembershipCategory> membershipCategories = [];
  List<ShowMembershipCategory> showMembershipCategories = [];

  ActiveMemberships? activeMemberships(int id) {
    final value = activeMembership.lastWhere(
        (element) => element.membershipId == id,
        orElse: () => ActiveMemberships());
    return value.id != null ? value : null;
  }

  /// GZ#1508 — a customer can hold MORE THAN ONE active membership of the same
  /// type (e.g. a depleted pass plus a freshly topped-up one). Return every
  /// real active row for [id] so the UI can render one card per pass, instead
  /// of `activeMemberships()` collapsing them to a single `lastWhere` match
  /// (which hid the topped-up pass behind the 0-hour one).
  List<ActiveMemberships> activeMembershipsFor(int id) {
    return activeMembership
        .where((element) => element.membershipId == id && element.id != null)
        .toList();
  }

  ActiveMemberships? get haveActiveClubMembership {
    final value = activeMembership.lastWhere(
        (element) => (element.membershipName ?? "")
            .toLowerCase()
            .contains("padel rush"),
        orElse: () => ActiveMemberships());
    return value.id != null ? value : null;
  }

  MembershipModel? get haveClubMembership {
    final value = membershipModel.lastWhere(
        (element) => (element.membershipName ?? "")
            .toLowerCase()
            .contains("padel rush"),
        orElse: () => MembershipModel());
    return value.id != null ? value : null;
  }

  Map<String, List<MembershipModel>> getMembershipDetails(
      List<int> selectedMembershipCategory, bool showAllMembership) {
    final Map<String, List<MembershipModel>> membershipDetails = {};
    for (int id in selectedMembershipCategory) {
      List<MembershipModel> memberships = membershipModel
          .where((element) => element.membershipCategoryId == id)
          .toList();
      final categoryName = membershipCategories
              .firstWhere((category) => category.id == id,
                  orElse: () => MembershipCategory())
              .categoryName ??
          "Unknown";

      if (!showAllMembership) {
        memberships = memberships
            .where((element) =>
                activeMemberships(element.id ?? 0) != null ||
                (element.appAvailable ?? false))
            .toList();
      }

      membershipDetails[categoryName] = memberships;
    }
    return membershipDetails;
  }

  List<MembershipModel> getMemberships(int selectedIndex) {
    if (showMembershipCategories.isEmpty) return [];
    final categoryIds = showMembershipCategories.length > selectedIndex
        ? showMembershipCategories[selectedIndex].id
        : <int>[];
    final value = membershipModel
        .where((element) => categoryIds.contains(element.membershipCategoryId))
        .toList();
    return value.isNotEmpty ? value : [];
  }

  UserActiveMembership(
      {required this.activeMembership,
      required this.membershipModel,
      required this.membershipCategories}) {
    this.activeMembership = [...activeMembership];
    this.membershipModel = [...membershipModel];
    this.membershipCategories = [...membershipCategories];
    _prepareShowMembershipCategories();
  }

  UserActiveMembership.fromJson(Map<String, dynamic> json) {
    if (json['activeMembership'] != null) {
      activeMembership = <ActiveMemberships>[];
      json['wallets'].forEach((v) {
        activeMembership.add(ActiveMemberships.fromJson(v));
      });
    }
    if (json['membershipModel'] != null) {
      membershipModel = <MembershipModel>[];
      json['userMemberships'].forEach((v) {
        membershipModel.add(MembershipModel.fromJson(v));
      });
    }
    if (json['membershipCategories'] != null) {
      membershipCategories = <MembershipCategory>[];
      json['membershipCategories'].forEach((v) {
        membershipCategories.add(MembershipCategory.fromJson(v));
      });
    }

    _prepareShowMembershipCategories();
  }

  void _prepareShowMembershipCategories() {
    try {
      ShowMembershipCategory pickleballCategory =
          ShowMembershipCategory(categoryName: "pickleball");
      ShowMembershipCategory padelCategory =
          ShowMembershipCategory(categoryName: "padel");
      final tempMembershipCategories = [];
      this.membershipCategories.forEach((e) {
        if ((e.categoryName ?? "").toLowerCase() == "padel") {
          padelCategory.id.add(e.id ?? 0);
        } else {
          pickleballCategory.id.add(e.id ?? 0);
        }
      });
      if (padelCategory.id.isNotEmpty) {
        tempMembershipCategories.add(padelCategory);
      }
      if (pickleballCategory.id.isNotEmpty) {
        tempMembershipCategories.add(pickleballCategory);
      }
      this.showMembershipCategories = [...tempMembershipCategories];
    } catch (e) {
      myPrint("-------- Error in Membership $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activeMembership'] = activeMembership.map((v) => v.toJson()).toList();
    data['membershipModel'] = membershipModel.map((v) => v.toJson()).toList();
    data['membershipCategories'] =
        membershipCategories.map((v) => v.toJson()).toList();
    return data;
  }
}
