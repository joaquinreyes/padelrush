// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playRepo)
final playRepoProvider = PlayRepoProvider._();

final class PlayRepoProvider
    extends $FunctionalProvider<PlayRepo, PlayRepo, PlayRepo>
    with $Provider<PlayRepo> {
  PlayRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'playRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$playRepoHash();

  @$internal
  @override
  $ProviderElement<PlayRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayRepo create(Ref ref) {
    return playRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayRepo>(value),
    );
  }
}

String _$playRepoHash() => r'76b578b12e07c15077c1338a15980b902cefba90';

@ProviderFor(openMatchesList)
final openMatchesListProvider = OpenMatchesListFamily._();

final class OpenMatchesListProvider extends $FunctionalProvider<
        AsyncValue<List<OpenMatchModel>>,
        List<OpenMatchModel>,
        FutureOr<List<OpenMatchModel>>>
    with
        $FutureModifier<List<OpenMatchModel>>,
        $FutureProvider<List<OpenMatchModel>> {
  OpenMatchesListProvider._(
      {required OpenMatchesListFamily super.from,
      required ({
        DateTime startDate,
        DateTime endDate,
        List<int> locationIDs,
        List<int> sportsIds,
        int minLevel,
        int maxLevel,
      })
          super.argument})
      : super(
          retry: null,
          name: r'openMatchesListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openMatchesListHash();

  @override
  String toString() {
    return r'openMatchesListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<OpenMatchModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<OpenMatchModel>> create(Ref ref) {
    final argument = this.argument as ({
      DateTime startDate,
      DateTime endDate,
      List<int> locationIDs,
      List<int> sportsIds,
      int minLevel,
      int maxLevel,
    });
    return openMatchesList(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
      locationIDs: argument.locationIDs,
      sportsIds: argument.sportsIds,
      minLevel: argument.minLevel,
      maxLevel: argument.maxLevel,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is OpenMatchesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$openMatchesListHash() => r'5d944d6a078acd11b5c29e996f37fa3bd7453c3a';

final class OpenMatchesListFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<OpenMatchModel>>,
            ({
              DateTime startDate,
              DateTime endDate,
              List<int> locationIDs,
              List<int> sportsIds,
              int minLevel,
              int maxLevel,
            })> {
  OpenMatchesListFamily._()
      : super(
          retry: null,
          name: r'openMatchesListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  OpenMatchesListProvider call({
    required DateTime startDate,
    required DateTime endDate,
    List<int> locationIDs = const [],
    List<int> sportsIds = const [],
    required int minLevel,
    required int maxLevel,
  }) =>
      OpenMatchesListProvider._(argument: (
        startDate: startDate,
        endDate: endDate,
        locationIDs: locationIDs,
        sportsIds: sportsIds,
        minLevel: minLevel,
        maxLevel: maxLevel,
      ), from: this);

  @override
  String toString() => r'openMatchesListProvider';
}

@ProviderFor(eventsList)
final eventsListProvider = EventsListFamily._();

final class EventsListProvider extends $FunctionalProvider<
        AsyncValue<List<EventsModel>>,
        List<EventsModel>,
        FutureOr<List<EventsModel>>>
    with
        $FutureModifier<List<EventsModel>>,
        $FutureProvider<List<EventsModel>> {
  EventsListProvider._(
      {required EventsListFamily super.from,
      required ({
        DateTime startDate,
        DateTime endDate,
        List<int>? locationIDs,
        List<int>? sportsIds,
      })
          super.argument})
      : super(
          retry: null,
          name: r'eventsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$eventsListHash();

  @override
  String toString() {
    return r'eventsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<EventsModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<EventsModel>> create(Ref ref) {
    final argument = this.argument as ({
      DateTime startDate,
      DateTime endDate,
      List<int>? locationIDs,
      List<int>? sportsIds,
    });
    return eventsList(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
      locationIDs: argument.locationIDs,
      sportsIds: argument.sportsIds,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EventsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventsListHash() => r'b2c1ef627e78ef7bf0953b7a1dbbf5f6e1b0c307';

final class EventsListFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<EventsModel>>,
            ({
              DateTime startDate,
              DateTime endDate,
              List<int>? locationIDs,
              List<int>? sportsIds,
            })> {
  EventsListFamily._()
      : super(
          retry: null,
          name: r'eventsListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  EventsListProvider call({
    required DateTime startDate,
    required DateTime endDate,
    List<int>? locationIDs,
    List<int>? sportsIds,
  }) =>
      EventsListProvider._(argument: (
        startDate: startDate,
        endDate: endDate,
        locationIDs: locationIDs,
        sportsIds: sportsIds,
      ), from: this);

  @override
  String toString() => r'eventsListProvider';
}

@ProviderFor(lessonsList)
final lessonsListProvider = LessonsListFamily._();

final class LessonsListProvider extends $FunctionalProvider<
        AsyncValue<List<LessonsModel>>,
        List<LessonsModel>,
        FutureOr<List<LessonsModel>>>
    with
        $FutureModifier<List<LessonsModel>>,
        $FutureProvider<List<LessonsModel>> {
  LessonsListProvider._(
      {required LessonsListFamily super.from,
      required ({
        DateTime startDate,
        DateTime endDate,
        List<int> locationIDs,
        List<int> sportsIds,
      })
          super.argument})
      : super(
          retry: null,
          name: r'lessonsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$lessonsListHash();

  @override
  String toString() {
    return r'lessonsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<LessonsModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<LessonsModel>> create(Ref ref) {
    final argument = this.argument as ({
      DateTime startDate,
      DateTime endDate,
      List<int> locationIDs,
      List<int> sportsIds,
    });
    return lessonsList(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
      locationIDs: argument.locationIDs,
      sportsIds: argument.sportsIds,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LessonsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonsListHash() => r'2ced34d337190cd5c4e33f233f7fbac607bc6e32';

final class LessonsListFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<LessonsModel>>,
            ({
              DateTime startDate,
              DateTime endDate,
              List<int> locationIDs,
              List<int> sportsIds,
            })> {
  LessonsListFamily._()
      : super(
          retry: null,
          name: r'lessonsListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LessonsListProvider call({
    required DateTime startDate,
    required DateTime endDate,
    List<int> locationIDs = const [],
    List<int> sportsIds = const [],
  }) =>
      LessonsListProvider._(argument: (
        startDate: startDate,
        endDate: endDate,
        locationIDs: locationIDs,
        sportsIds: sportsIds,
      ), from: this);

  @override
  String toString() => r'lessonsListProvider';
}

@ProviderFor(fetchServiceDetail)
final fetchServiceDetailProvider = FetchServiceDetailFamily._();

final class FetchServiceDetailProvider extends $FunctionalProvider<
        AsyncValue<ServiceDetail>, ServiceDetail, FutureOr<ServiceDetail>>
    with $FutureModifier<ServiceDetail>, $FutureProvider<ServiceDetail> {
  FetchServiceDetailProvider._(
      {required FetchServiceDetailFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'fetchServiceDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchServiceDetailHash();

  @override
  String toString() {
    return r'fetchServiceDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ServiceDetail> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ServiceDetail> create(Ref ref) {
    final argument = this.argument as int;
    return fetchServiceDetail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchServiceDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchServiceDetailHash() =>
    r'd98c29a6dcac33936632a779b1a38320e2dc44e6';

final class FetchServiceDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ServiceDetail>, int> {
  FetchServiceDetailFamily._()
      : super(
          retry: null,
          name: r'fetchServiceDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchServiceDetailProvider call(
    int serviceID,
  ) =>
      FetchServiceDetailProvider._(argument: serviceID, from: this);

  @override
  String toString() => r'fetchServiceDetailProvider';
}

@ProviderFor(joinService)
final joinServiceProvider = JoinServiceFamily._();

final class JoinServiceProvider
    extends $FunctionalProvider<AsyncValue<double?>, double?, FutureOr<double?>>
    with $FutureModifier<double?>, $FutureProvider<double?> {
  JoinServiceProvider._(
      {required JoinServiceFamily super.from,
      required (
        int, {
        int? playerId,
        int position,
        bool isEvent,
        bool isOpenMatch,
        bool isDouble,
        bool isReserve,
        bool isLesson,
        bool? pendingPayment,
        bool isApprovalNeeded,
      })
          super.argument})
      : super(
          retry: null,
          name: r'joinServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$joinServiceHash();

  @override
  String toString() {
    return r'joinServiceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double?> create(Ref ref) {
    final argument = this.argument as (
      int, {
      int? playerId,
      int position,
      bool isEvent,
      bool isOpenMatch,
      bool isDouble,
      bool isReserve,
      bool isLesson,
      bool? pendingPayment,
      bool isApprovalNeeded,
    });
    return joinService(
      ref,
      argument.$1,
      playerId: argument.playerId,
      position: argument.position,
      isEvent: argument.isEvent,
      isOpenMatch: argument.isOpenMatch,
      isDouble: argument.isDouble,
      isReserve: argument.isReserve,
      isLesson: argument.isLesson,
      pendingPayment: argument.pendingPayment,
      isApprovalNeeded: argument.isApprovalNeeded,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JoinServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$joinServiceHash() => r'c11d99e7024691f2cc03f4d439374953d402e216';

final class JoinServiceFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<double?>,
            (
              int, {
              int? playerId,
              int position,
              bool isEvent,
              bool isOpenMatch,
              bool isDouble,
              bool isReserve,
              bool isLesson,
              bool? pendingPayment,
              bool isApprovalNeeded,
            })> {
  JoinServiceFamily._()
      : super(
          retry: null,
          name: r'joinServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  JoinServiceProvider call(
    int id, {
    int? playerId,
    required int position,
    required bool isEvent,
    required bool isOpenMatch,
    required bool isDouble,
    required bool isReserve,
    required bool isLesson,
    bool? pendingPayment,
    bool isApprovalNeeded = false,
  }) =>
      JoinServiceProvider._(argument: (
        id,
        playerId: playerId,
        position: position,
        isEvent: isEvent,
        isOpenMatch: isOpenMatch,
        isDouble: isDouble,
        isReserve: isReserve,
        isLesson: isLesson,
        pendingPayment: pendingPayment,
        isApprovalNeeded: isApprovalNeeded,
      ), from: this);

  @override
  String toString() => r'joinServiceProvider';
}

@ProviderFor(cancelService)
final cancelServiceProvider = CancelServiceFamily._();

final class CancelServiceProvider
    extends $FunctionalProvider<AsyncValue<bool?>, bool?, FutureOr<bool?>>
    with $FutureModifier<bool?>, $FutureProvider<bool?> {
  CancelServiceProvider._(
      {required CancelServiceFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'cancelServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cancelServiceHash();

  @override
  String toString() {
    return r'cancelServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool?> create(Ref ref) {
    final argument = this.argument as int;
    return cancelService(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CancelServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cancelServiceHash() => r'14e5982e94f4436ac86b07bc38e8fd94626c2897';

final class CancelServiceFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool?>, int> {
  CancelServiceFamily._()
      : super(
          retry: null,
          name: r'cancelServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CancelServiceProvider call(
    int id,
  ) =>
      CancelServiceProvider._(argument: id, from: this);

  @override
  String toString() => r'cancelServiceProvider';
}

@ProviderFor(fetchServiceWaitingPlayers)
final fetchServiceWaitingPlayersProvider = FetchServiceWaitingPlayersFamily._();

final class FetchServiceWaitingPlayersProvider extends $FunctionalProvider<
        AsyncValue<List<ServiceWaitingPlayers>>,
        List<ServiceWaitingPlayers>,
        FutureOr<List<ServiceWaitingPlayers>>>
    with
        $FutureModifier<List<ServiceWaitingPlayers>>,
        $FutureProvider<List<ServiceWaitingPlayers>> {
  FetchServiceWaitingPlayersProvider._(
      {required FetchServiceWaitingPlayersFamily super.from,
      required (
        int,
        RequestServiceType,
      )
          super.argument})
      : super(
          retry: null,
          name: r'fetchServiceWaitingPlayersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchServiceWaitingPlayersHash();

  @override
  String toString() {
    return r'fetchServiceWaitingPlayersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<ServiceWaitingPlayers>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<ServiceWaitingPlayers>> create(Ref ref) {
    final argument = this.argument as (
      int,
      RequestServiceType,
    );
    return fetchServiceWaitingPlayers(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchServiceWaitingPlayersProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchServiceWaitingPlayersHash() =>
    r'5dc8f805ba2536f2daa454c21d22fddc1d51a388';

final class FetchServiceWaitingPlayersFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<ServiceWaitingPlayers>>,
            (
              int,
              RequestServiceType,
            )> {
  FetchServiceWaitingPlayersFamily._()
      : super(
          retry: null,
          name: r'fetchServiceWaitingPlayersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchServiceWaitingPlayersProvider call(
    int id,
    RequestServiceType requestServiceType,
  ) =>
      FetchServiceWaitingPlayersProvider._(argument: (
        id,
        requestServiceType,
      ), from: this);

  @override
  String toString() => r'fetchServiceWaitingPlayersProvider';
}

@ProviderFor(approvePlayer)
final approvePlayerProvider = ApprovePlayerFamily._();

final class ApprovePlayerProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  ApprovePlayerProvider._(
      {required ApprovePlayerFamily super.from,
      required ({
        bool isApprove,
        int serviceID,
        int playerID,
      })
          super.argument})
      : super(
          retry: null,
          name: r'approvePlayerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$approvePlayerHash();

  @override
  String toString() {
    return r'approvePlayerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      bool isApprove,
      int serviceID,
      int playerID,
    });
    return approvePlayer(
      ref,
      isApprove: argument.isApprove,
      serviceID: argument.serviceID,
      playerID: argument.playerID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ApprovePlayerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$approvePlayerHash() => r'e99edc7be9b082b9f82197c6d1d2a37d2d90841f';

final class ApprovePlayerFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              bool isApprove,
              int serviceID,
              int playerID,
            })> {
  ApprovePlayerFamily._()
      : super(
          retry: null,
          name: r'approvePlayerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ApprovePlayerProvider call({
    bool isApprove = true,
    required int serviceID,
    required int playerID,
  }) =>
      ApprovePlayerProvider._(argument: (
        isApprove: isApprove,
        serviceID: serviceID,
        playerID: playerID,
      ), from: this);

  @override
  String toString() => r'approvePlayerProvider';
}

@ProviderFor(deleteReserved)
final deleteReservedProvider = DeleteReservedFamily._();

final class DeleteReservedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  DeleteReservedProvider._(
      {required DeleteReservedFamily super.from,
      required (
        int,
        int,
      )
          super.argument})
      : super(
          retry: null,
          name: r'deleteReservedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteReservedHash();

  @override
  String toString() {
    return r'deleteReservedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as (
      int,
      int,
    );
    return deleteReserved(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteReservedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteReservedHash() => r'd8afe6e550cf0a55a1d66aad140a0c42831db904';

final class DeleteReservedFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            (
              int,
              int,
            )> {
  DeleteReservedFamily._()
      : super(
          retry: null,
          name: r'deleteReservedProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteReservedProvider call(
    int serviceID,
    int reservedID,
  ) =>
      DeleteReservedProvider._(argument: (
        serviceID,
        reservedID,
      ), from: this);

  @override
  String toString() => r'deleteReservedProvider';
}

@ProviderFor(submitAssessment)
final submitAssessmentProvider = SubmitAssessmentFamily._();

final class SubmitAssessmentProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  SubmitAssessmentProvider._(
      {required SubmitAssessmentFamily super.from,
      required ({
        AssessmentReqModel model,
        int serviceID,
      })
          super.argument})
      : super(
          retry: null,
          name: r'submitAssessmentProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$submitAssessmentHash();

  @override
  String toString() {
    return r'submitAssessmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      AssessmentReqModel model,
      int serviceID,
    });
    return submitAssessment(
      ref,
      model: argument.model,
      serviceID: argument.serviceID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitAssessmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$submitAssessmentHash() => r'898dc52ba672081185f872f6a0f60bbb7416cac7';

final class SubmitAssessmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              AssessmentReqModel model,
              int serviceID,
            })> {
  SubmitAssessmentFamily._()
      : super(
          retry: null,
          name: r'submitAssessmentProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SubmitAssessmentProvider call({
    required AssessmentReqModel model,
    required int serviceID,
  }) =>
      SubmitAssessmentProvider._(argument: (
        model: model,
        serviceID: serviceID,
      ), from: this);

  @override
  String toString() => r'submitAssessmentProvider';
}

@ProviderFor(fetchAssessment)
final fetchAssessmentProvider = FetchAssessmentFamily._();

final class FetchAssessmentProvider extends $FunctionalProvider<
        AsyncValue<AssessmentResModel>,
        AssessmentResModel,
        FutureOr<AssessmentResModel>>
    with
        $FutureModifier<AssessmentResModel>,
        $FutureProvider<AssessmentResModel> {
  FetchAssessmentProvider._(
      {required FetchAssessmentFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'fetchAssessmentProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchAssessmentHash();

  @override
  String toString() {
    return r'fetchAssessmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AssessmentResModel> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AssessmentResModel> create(Ref ref) {
    final argument = this.argument as int;
    return fetchAssessment(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAssessmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAssessmentHash() => r'ca05e1d2d62609da67af1a523e4eb596f3abe4a4';

final class FetchAssessmentFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AssessmentResModel>, int> {
  FetchAssessmentFamily._()
      : super(
          retry: null,
          name: r'fetchAssessmentProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchAssessmentProvider call(
    int serviceID,
  ) =>
      FetchAssessmentProvider._(argument: serviceID, from: this);

  @override
  String toString() => r'fetchAssessmentProvider';
}

@ProviderFor(lessonsSlot)
final lessonsSlotProvider = LessonsSlotFamily._();

final class LessonsSlotProvider extends $FunctionalProvider<
        AsyncValue<LessonModelNew>, LessonModelNew, FutureOr<LessonModelNew>>
    with $FutureModifier<LessonModelNew>, $FutureProvider<LessonModelNew> {
  LessonsSlotProvider._(
      {required LessonsSlotFamily super.from,
      required ({
        DateTime startTime,
        DateTime? endTime,
        int? duration,
        List<int> coachId,
        String sportName,
      })
          super.argument})
      : super(
          retry: null,
          name: r'lessonsSlotProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$lessonsSlotHash();

  @override
  String toString() {
    return r'lessonsSlotProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LessonModelNew> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LessonModelNew> create(Ref ref) {
    final argument = this.argument as ({
      DateTime startTime,
      DateTime? endTime,
      int? duration,
      List<int> coachId,
      String sportName,
    });
    return lessonsSlot(
      ref,
      startTime: argument.startTime,
      endTime: argument.endTime,
      duration: argument.duration,
      coachId: argument.coachId,
      sportName: argument.sportName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LessonsSlotProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonsSlotHash() => r'9adec31c9d475fdbab49b034564d34f16e5f6b25';

final class LessonsSlotFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<LessonModelNew>,
            ({
              DateTime startTime,
              DateTime? endTime,
              int? duration,
              List<int> coachId,
              String sportName,
            })> {
  LessonsSlotFamily._()
      : super(
          retry: null,
          name: r'lessonsSlotProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LessonsSlotProvider call({
    required DateTime startTime,
    DateTime? endTime,
    required int? duration,
    required List<int> coachId,
    required String sportName,
  }) =>
      LessonsSlotProvider._(argument: (
        startTime: startTime,
        endTime: endTime,
        duration: duration,
        coachId: coachId,
        sportName: sportName,
      ), from: this);

  @override
  String toString() => r'lessonsSlotProvider';
}

@ProviderFor(joinWaitingList)
final joinWaitingListProvider = JoinWaitingListFamily._();

final class JoinWaitingListProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  JoinWaitingListProvider._(
      {required JoinWaitingListFamily super.from,
      required ({
        int position,
        int serviceId,
      })
          super.argument})
      : super(
          retry: null,
          name: r'joinWaitingListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$joinWaitingListHash();

  @override
  String toString() {
    return r'joinWaitingListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as ({
      int position,
      int serviceId,
    });
    return joinWaitingList(
      ref,
      position: argument.position,
      serviceId: argument.serviceId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JoinWaitingListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$joinWaitingListHash() => r'8a8ab8ebfbfed6d84f93398c8dabbfbc53966611';

final class JoinWaitingListFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<String?>,
            ({
              int position,
              int serviceId,
            })> {
  JoinWaitingListFamily._()
      : super(
          retry: null,
          name: r'joinWaitingListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  JoinWaitingListProvider call({
    required int position,
    required int serviceId,
  }) =>
      JoinWaitingListProvider._(argument: (
        position: position,
        serviceId: serviceId,
      ), from: this);

  @override
  String toString() => r'joinWaitingListProvider';
}

@ProviderFor(cancellationPolicy)
final cancellationPolicyProvider = CancellationPolicyFamily._();

final class CancellationPolicyProvider extends $FunctionalProvider<
        AsyncValue<CancellationPolicy>,
        CancellationPolicy,
        FutureOr<CancellationPolicy>>
    with
        $FutureModifier<CancellationPolicy>,
        $FutureProvider<CancellationPolicy> {
  CancellationPolicyProvider._(
      {required CancellationPolicyFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'cancellationPolicyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cancellationPolicyHash();

  @override
  String toString() {
    return r'cancellationPolicyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CancellationPolicy> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CancellationPolicy> create(Ref ref) {
    final argument = this.argument as int;
    return cancellationPolicy(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CancellationPolicyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cancellationPolicyHash() =>
    r'4a516613818cdfea94baf8f49490bf07bce63206';

final class CancellationPolicyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CancellationPolicy>, int> {
  CancellationPolicyFamily._()
      : super(
          retry: null,
          name: r'cancellationPolicyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CancellationPolicyProvider call(
    int id,
  ) =>
      CancellationPolicyProvider._(argument: id, from: this);

  @override
  String toString() => r'cancellationPolicyProvider';
}

@ProviderFor(addPlayersToWaitingList)
final addPlayersToWaitingListProvider = AddPlayersToWaitingListFamily._();

final class AddPlayersToWaitingListProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  AddPlayersToWaitingListProvider._(
      {required AddPlayersToWaitingListFamily super.from,
      required ({
        int serviceId,
        List<Map<String, dynamic>> customerPlayers,
      })
          super.argument})
      : super(
          retry: null,
          name: r'addPlayersToWaitingListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addPlayersToWaitingListHash();

  @override
  String toString() {
    return r'addPlayersToWaitingListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      int serviceId,
      List<Map<String, dynamic>> customerPlayers,
    });
    return addPlayersToWaitingList(
      ref,
      serviceId: argument.serviceId,
      customerPlayers: argument.customerPlayers,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddPlayersToWaitingListProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addPlayersToWaitingListHash() =>
    r'6f266db30485235fc0bca8e8a1e9da5dffd827c4';

final class AddPlayersToWaitingListFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              int serviceId,
              List<Map<String, dynamic>> customerPlayers,
            })> {
  AddPlayersToWaitingListFamily._()
      : super(
          retry: null,
          name: r'addPlayersToWaitingListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AddPlayersToWaitingListProvider call({
    required int serviceId,
    required List<Map<String, dynamic>> customerPlayers,
  }) =>
      AddPlayersToWaitingListProvider._(argument: (
        serviceId: serviceId,
        customerPlayers: customerPlayers,
      ), from: this);

  @override
  String toString() => r'addPlayersToWaitingListProvider';
}

@ProviderFor(waitingListActionProvider)
final waitingListActionProviderProvider = WaitingListActionProviderFamily._();

final class WaitingListActionProviderProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  WaitingListActionProviderProvider._(
      {required WaitingListActionProviderFamily super.from,
      required ({
        int waitingListId,
        String action,
      })
          super.argument})
      : super(
          retry: null,
          name: r'waitingListActionProviderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$waitingListActionProviderHash();

  @override
  String toString() {
    return r'waitingListActionProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      int waitingListId,
      String action,
    });
    return waitingListActionProvider(
      ref,
      waitingListId: argument.waitingListId,
      action: argument.action,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaitingListActionProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waitingListActionProviderHash() =>
    r'43ea66176c36a51a02c8fe48bddcc5095fe67f9d';

final class WaitingListActionProviderFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              int waitingListId,
              String action,
            })> {
  WaitingListActionProviderFamily._()
      : super(
          retry: null,
          name: r'waitingListActionProviderProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  WaitingListActionProviderProvider call({
    required int waitingListId,
    required String action,
  }) =>
      WaitingListActionProviderProvider._(argument: (
        waitingListId: waitingListId,
        action: action,
      ), from: this);

  @override
  String toString() => r'waitingListActionProviderProvider';
}

@ProviderFor(fetchAllCoaches)
final fetchAllCoachesProvider = FetchAllCoachesProvider._();

final class FetchAllCoachesProvider extends $FunctionalProvider<
        AsyncValue<List<CoachListModel>>,
        List<CoachListModel>,
        FutureOr<List<CoachListModel>>>
    with
        $FutureModifier<List<CoachListModel>>,
        $FutureProvider<List<CoachListModel>> {
  FetchAllCoachesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchAllCoachesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchAllCoachesHash();

  @$internal
  @override
  $FutureProviderElement<List<CoachListModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<CoachListModel>> create(Ref ref) {
    return fetchAllCoaches(ref);
  }
}

String _$fetchAllCoachesHash() => r'00b63a66750257be5d65c6287820e078ac2adf54';

@ProviderFor(fetchBlockedCoaches)
final fetchBlockedCoachesProvider = FetchBlockedCoachesFamily._();

final class FetchBlockedCoachesProvider extends $FunctionalProvider<
        AsyncValue<List<String>>, List<String>, FutureOr<List<String>>>
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  FetchBlockedCoachesProvider._(
      {required FetchBlockedCoachesFamily super.from,
      required ({
        DateTime startDate,
        DateTime endDate,
        String sportName,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchBlockedCoachesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchBlockedCoachesHash();

  @override
  String toString() {
    return r'fetchBlockedCoachesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    final argument = this.argument as ({
      DateTime startDate,
      DateTime endDate,
      String sportName,
    });
    return fetchBlockedCoaches(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
      sportName: argument.sportName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBlockedCoachesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchBlockedCoachesHash() =>
    r'3571e2ce40a948111bd5a0ca0b29895f859de794';

final class FetchBlockedCoachesFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<String>>,
            ({
              DateTime startDate,
              DateTime endDate,
              String sportName,
            })> {
  FetchBlockedCoachesFamily._()
      : super(
          retry: null,
          name: r'fetchBlockedCoachesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchBlockedCoachesProvider call({
    required DateTime startDate,
    required DateTime endDate,
    required String sportName,
  }) =>
      FetchBlockedCoachesProvider._(argument: (
        startDate: startDate,
        endDate: endDate,
        sportName: sportName,
      ), from: this);

  @override
  String toString() => r'fetchBlockedCoachesProvider';
}

@ProviderFor(updateServiceSettings)
final updateServiceSettingsProvider = UpdateServiceSettingsFamily._();

final class UpdateServiceSettingsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  UpdateServiceSettingsProvider._(
      {required UpdateServiceSettingsFamily super.from,
      required ({
        int serviceId,
        bool approveBeforeJoin,
        bool friendlyMatch,
        double minLevel,
        double maxLevel,
      })
          super.argument})
      : super(
          retry: null,
          name: r'updateServiceSettingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateServiceSettingsHash();

  @override
  String toString() {
    return r'updateServiceSettingsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      int serviceId,
      bool approveBeforeJoin,
      bool friendlyMatch,
      double minLevel,
      double maxLevel,
    });
    return updateServiceSettings(
      ref,
      serviceId: argument.serviceId,
      approveBeforeJoin: argument.approveBeforeJoin,
      friendlyMatch: argument.friendlyMatch,
      minLevel: argument.minLevel,
      maxLevel: argument.maxLevel,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateServiceSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateServiceSettingsHash() =>
    r'aabeeec67d56d2b80a951ee85094be9816fc295a';

final class UpdateServiceSettingsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              int serviceId,
              bool approveBeforeJoin,
              bool friendlyMatch,
              double minLevel,
              double maxLevel,
            })> {
  UpdateServiceSettingsFamily._()
      : super(
          retry: null,
          name: r'updateServiceSettingsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateServiceSettingsProvider call({
    required int serviceId,
    required bool approveBeforeJoin,
    required bool friendlyMatch,
    required double minLevel,
    required double maxLevel,
  }) =>
      UpdateServiceSettingsProvider._(argument: (
        serviceId: serviceId,
        approveBeforeJoin: approveBeforeJoin,
        friendlyMatch: friendlyMatch,
        minLevel: minLevel,
        maxLevel: maxLevel,
      ), from: this);

  @override
  String toString() => r'updateServiceSettingsProvider';
}
