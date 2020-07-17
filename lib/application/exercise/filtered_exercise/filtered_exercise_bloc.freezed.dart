// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'filtered_exercise_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FilteredExerciseEventTearOff {
  const _$FilteredExerciseEventTearOff();

  _Searched searched({@required String term}) {
    return _Searched(
      term: term,
    );
  }

  _Refreshed refreshed({@required List<Exercise> exercises}) {
    return _Refreshed(
      exercises: exercises,
    );
  }
}

// ignore: unused_element
const $FilteredExerciseEvent = _$FilteredExerciseEventTearOff();

mixin _$FilteredExerciseEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result searched(String term),
    @required Result refreshed(List<Exercise> exercises),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result searched(String term),
    Result refreshed(List<Exercise> exercises),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result searched(_Searched value),
    @required Result refreshed(_Refreshed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result searched(_Searched value),
    Result refreshed(_Refreshed value),
    @required Result orElse(),
  });
}

abstract class $FilteredExerciseEventCopyWith<$Res> {
  factory $FilteredExerciseEventCopyWith(FilteredExerciseEvent value,
          $Res Function(FilteredExerciseEvent) then) =
      _$FilteredExerciseEventCopyWithImpl<$Res>;
}

class _$FilteredExerciseEventCopyWithImpl<$Res>
    implements $FilteredExerciseEventCopyWith<$Res> {
  _$FilteredExerciseEventCopyWithImpl(this._value, this._then);

  final FilteredExerciseEvent _value;
  // ignore: unused_field
  final $Res Function(FilteredExerciseEvent) _then;
}

abstract class _$SearchedCopyWith<$Res> {
  factory _$SearchedCopyWith(_Searched value, $Res Function(_Searched) then) =
      __$SearchedCopyWithImpl<$Res>;
  $Res call({String term});
}

class __$SearchedCopyWithImpl<$Res>
    extends _$FilteredExerciseEventCopyWithImpl<$Res>
    implements _$SearchedCopyWith<$Res> {
  __$SearchedCopyWithImpl(_Searched _value, $Res Function(_Searched) _then)
      : super(_value, (v) => _then(v as _Searched));

  @override
  _Searched get _value => super._value as _Searched;

  @override
  $Res call({
    Object term = freezed,
  }) {
    return _then(_Searched(
      term: term == freezed ? _value.term : term as String,
    ));
  }
}

class _$_Searched implements _Searched {
  const _$_Searched({@required this.term}) : assert(term != null);

  @override
  final String term;

  @override
  String toString() {
    return 'FilteredExerciseEvent.searched(term: $term)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Searched &&
            (identical(other.term, term) ||
                const DeepCollectionEquality().equals(other.term, term)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(term);

  @override
  _$SearchedCopyWith<_Searched> get copyWith =>
      __$SearchedCopyWithImpl<_Searched>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result searched(String term),
    @required Result refreshed(List<Exercise> exercises),
  }) {
    assert(searched != null);
    assert(refreshed != null);
    return searched(term);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result searched(String term),
    Result refreshed(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searched != null) {
      return searched(term);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result searched(_Searched value),
    @required Result refreshed(_Refreshed value),
  }) {
    assert(searched != null);
    assert(refreshed != null);
    return searched(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result searched(_Searched value),
    Result refreshed(_Refreshed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searched != null) {
      return searched(this);
    }
    return orElse();
  }
}

abstract class _Searched implements FilteredExerciseEvent {
  const factory _Searched({@required String term}) = _$_Searched;

  String get term;
  _$SearchedCopyWith<_Searched> get copyWith;
}

abstract class _$RefreshedCopyWith<$Res> {
  factory _$RefreshedCopyWith(
          _Refreshed value, $Res Function(_Refreshed) then) =
      __$RefreshedCopyWithImpl<$Res>;
  $Res call({List<Exercise> exercises});
}

class __$RefreshedCopyWithImpl<$Res>
    extends _$FilteredExerciseEventCopyWithImpl<$Res>
    implements _$RefreshedCopyWith<$Res> {
  __$RefreshedCopyWithImpl(_Refreshed _value, $Res Function(_Refreshed) _then)
      : super(_value, (v) => _then(v as _Refreshed));

  @override
  _Refreshed get _value => super._value as _Refreshed;

  @override
  $Res call({
    Object exercises = freezed,
  }) {
    return _then(_Refreshed(
      exercises:
          exercises == freezed ? _value.exercises : exercises as List<Exercise>,
    ));
  }
}

class _$_Refreshed implements _Refreshed {
  const _$_Refreshed({@required this.exercises}) : assert(exercises != null);

  @override
  final List<Exercise> exercises;

  @override
  String toString() {
    return 'FilteredExerciseEvent.refreshed(exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Refreshed &&
            (identical(other.exercises, exercises) ||
                const DeepCollectionEquality()
                    .equals(other.exercises, exercises)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercises);

  @override
  _$RefreshedCopyWith<_Refreshed> get copyWith =>
      __$RefreshedCopyWithImpl<_Refreshed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result searched(String term),
    @required Result refreshed(List<Exercise> exercises),
  }) {
    assert(searched != null);
    assert(refreshed != null);
    return refreshed(exercises);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result searched(String term),
    Result refreshed(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshed != null) {
      return refreshed(exercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result searched(_Searched value),
    @required Result refreshed(_Refreshed value),
  }) {
    assert(searched != null);
    assert(refreshed != null);
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result searched(_Searched value),
    Result refreshed(_Refreshed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class _Refreshed implements FilteredExerciseEvent {
  const factory _Refreshed({@required List<Exercise> exercises}) = _$_Refreshed;

  List<Exercise> get exercises;
  _$RefreshedCopyWith<_Refreshed> get copyWith;
}

class _$FilteredExerciseStateTearOff {
  const _$FilteredExerciseStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _LoadedExercise loaded({@required List<Exercise> exercises}) {
    return _LoadedExercise(
      exercises: exercises,
    );
  }
}

// ignore: unused_element
const $FilteredExerciseState = _$FilteredExerciseStateTearOff();

mixin _$FilteredExerciseState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<Exercise> exercises),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_LoadedExercise value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_LoadedExercise value),
    @required Result orElse(),
  });
}

abstract class $FilteredExerciseStateCopyWith<$Res> {
  factory $FilteredExerciseStateCopyWith(FilteredExerciseState value,
          $Res Function(FilteredExerciseState) then) =
      _$FilteredExerciseStateCopyWithImpl<$Res>;
}

class _$FilteredExerciseStateCopyWithImpl<$Res>
    implements $FilteredExerciseStateCopyWith<$Res> {
  _$FilteredExerciseStateCopyWithImpl(this._value, this._then);

  final FilteredExerciseState _value;
  // ignore: unused_field
  final $Res Function(FilteredExerciseState) _then;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

class __$LoadingCopyWithImpl<$Res>
    extends _$FilteredExerciseStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'FilteredExerciseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<Exercise> exercises),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_LoadedExercise value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_LoadedExercise value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FilteredExerciseState {
  const factory _Loading() = _$_Loading;
}

abstract class _$LoadedExerciseCopyWith<$Res> {
  factory _$LoadedExerciseCopyWith(
          _LoadedExercise value, $Res Function(_LoadedExercise) then) =
      __$LoadedExerciseCopyWithImpl<$Res>;
  $Res call({List<Exercise> exercises});
}

class __$LoadedExerciseCopyWithImpl<$Res>
    extends _$FilteredExerciseStateCopyWithImpl<$Res>
    implements _$LoadedExerciseCopyWith<$Res> {
  __$LoadedExerciseCopyWithImpl(
      _LoadedExercise _value, $Res Function(_LoadedExercise) _then)
      : super(_value, (v) => _then(v as _LoadedExercise));

  @override
  _LoadedExercise get _value => super._value as _LoadedExercise;

  @override
  $Res call({
    Object exercises = freezed,
  }) {
    return _then(_LoadedExercise(
      exercises:
          exercises == freezed ? _value.exercises : exercises as List<Exercise>,
    ));
  }
}

class _$_LoadedExercise implements _LoadedExercise {
  const _$_LoadedExercise({@required this.exercises})
      : assert(exercises != null);

  @override
  final List<Exercise> exercises;

  @override
  String toString() {
    return 'FilteredExerciseState.loaded(exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedExercise &&
            (identical(other.exercises, exercises) ||
                const DeepCollectionEquality()
                    .equals(other.exercises, exercises)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercises);

  @override
  _$LoadedExerciseCopyWith<_LoadedExercise> get copyWith =>
      __$LoadedExerciseCopyWithImpl<_LoadedExercise>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result loaded(List<Exercise> exercises),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(exercises);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(exercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result loaded(_LoadedExercise value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result loaded(_LoadedExercise value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedExercise implements FilteredExerciseState {
  const factory _LoadedExercise({@required List<Exercise> exercises}) =
      _$_LoadedExercise;

  List<Exercise> get exercises;
  _$LoadedExerciseCopyWith<_LoadedExercise> get copyWith;
}