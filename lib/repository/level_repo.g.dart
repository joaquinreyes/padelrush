// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(levelRepo)
final levelRepoProvider = LevelRepoProvider._();

final class LevelRepoProvider
    extends $FunctionalProvider<LevelRepo, LevelRepo, LevelRepo>
    with $Provider<LevelRepo> {
  LevelRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'levelRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$levelRepoHash();

  @$internal
  @override
  $ProviderElement<LevelRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LevelRepo create(Ref ref) {
    return levelRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LevelRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LevelRepo>(value),
    );
  }
}

String _$levelRepoHash() => r'bee40f7f9b5ccdf29867f92cf6c76d24e980bf2c';

@ProviderFor(levelQuestions)
final levelQuestionsProvider = LevelQuestionsFamily._();

final class LevelQuestionsProvider extends $FunctionalProvider<
        AsyncValue<List<LevelQuestion>>,
        List<LevelQuestion>,
        FutureOr<List<LevelQuestion>>>
    with
        $FutureModifier<List<LevelQuestion>>,
        $FutureProvider<List<LevelQuestion>> {
  LevelQuestionsProvider._(
      {required LevelQuestionsFamily super.from,
      required String? super.argument})
      : super(
          retry: null,
          name: r'levelQuestionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$levelQuestionsHash();

  @override
  String toString() {
    return r'levelQuestionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LevelQuestion>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<LevelQuestion>> create(Ref ref) {
    final argument = this.argument as String?;
    return levelQuestions(
      ref,
      sport: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LevelQuestionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$levelQuestionsHash() => r'd707490b294169135d461c7d81d06063fdf1520f';

final class LevelQuestionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LevelQuestion>>, String?> {
  LevelQuestionsFamily._()
      : super(
          retry: null,
          name: r'levelQuestionsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LevelQuestionsProvider call({
    String? sport,
  }) =>
      LevelQuestionsProvider._(argument: sport, from: this);

  @override
  String toString() => r'levelQuestionsProvider';
}

@ProviderFor(calculateLevel)
final calculateLevelProvider = CalculateLevelFamily._();

final class CalculateLevelProvider extends $FunctionalProvider<
        AsyncValue<CalculatedLevelData>,
        CalculatedLevelData,
        FutureOr<CalculatedLevelData>>
    with
        $FutureModifier<CalculatedLevelData>,
        $FutureProvider<CalculatedLevelData> {
  CalculateLevelProvider._(
      {required CalculateLevelFamily super.from,
      required ({
        List<double?> answers,
        bool allowClub,
        String sportsName,
      })
          super.argument})
      : super(
          retry: null,
          name: r'calculateLevelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$calculateLevelHash();

  @override
  String toString() {
    return r'calculateLevelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CalculatedLevelData> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CalculatedLevelData> create(Ref ref) {
    final argument = this.argument as ({
      List<double?> answers,
      bool allowClub,
      String sportsName,
    });
    return calculateLevel(
      ref,
      answers: argument.answers,
      allowClub: argument.allowClub,
      sportsName: argument.sportsName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CalculateLevelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$calculateLevelHash() => r'fa0b93f3069d655ede138ca013f7b52ff2bac28d';

final class CalculateLevelFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<CalculatedLevelData>,
            ({
              List<double?> answers,
              bool allowClub,
              String sportsName,
            })> {
  CalculateLevelFamily._()
      : super(
          retry: null,
          name: r'calculateLevelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CalculateLevelProvider call({
    required List<double?> answers,
    required bool allowClub,
    required String sportsName,
  }) =>
      CalculateLevelProvider._(argument: (
        answers: answers,
        allowClub: allowClub,
        sportsName: sportsName,
      ), from: this);

  @override
  String toString() => r'calculateLevelProvider';
}
