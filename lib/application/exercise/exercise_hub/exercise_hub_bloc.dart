import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitnick/domain/core/unique_id.dart';
import 'package:fitnick/domain/exercise/facade/i_exercise_facade.dart';
import 'package:fitnick/domain/exercise/failure/exercise_failure.dart';
import 'package:fitnick/domain/exercise/models/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_hub_event.dart';
part 'exercise_hub_state.dart';
part 'exercise_hub_bloc.freezed.dart';

class ExerciseHubBloc extends Bloc<ExerciseHubEvent, ExerciseHubState> {
  final IExerciseFacade iExerciseFacade;
  ExerciseHubBloc({@required this.iExerciseFacade})
      : super(ExerciseHubState.loading());

  @override
  Stream<ExerciseHubState> mapEventToState(
    ExerciseHubEvent event,
  ) async* {
    yield* event.when(
        init: _bindInitToState,
        exerciseAdded: _bindAddedToState,
        exerciseUpdated: _bindUpdatedToState,
        exerciseDeleted: _bindDeletedToState,
        exerciseReordered: _bindReorderedToState);
  }

  Stream<ExerciseHubState> _bindInitToState() async* {
    final failureOrSuccess = await iExerciseFacade.findAll();
    yield failureOrSuccess.fold(
        (failure) => ExerciseHubState.loadedError(failure: failure),
        (List<Exercise> exercises) =>
            ExerciseHubState.loaded(exercises: exercises));
  }

  Stream<ExerciseHubState> _bindAddedToState(Exercise exercise) async* {
    yield* state.maybeWhen(orElse: () async* {
      yield state;
    }, loaded: (List<Exercise> exercises) async* {
      yield* _mapAddedToState(exercise, exercises);
    }, reorderedError: (List<Exercise> exercises, _) async* {
      yield* _mapAddedToState(exercise, exercises);
    });
  }

  Stream<ExerciseHubState> _bindUpdatedToState(Exercise exercise) async* {
    //TODO: implement update
  }
  Stream<ExerciseHubState> _bindDeletedToState(UniqueId execiseId) async* {
    yield* state.maybeWhen(orElse: () async* {
      yield state;
    }, loaded: (List<Exercise> exercises) async* {
      yield* _mapDeletedToState(execiseId, exercises);
    }, reorderedError: (List<Exercise> exercises, _) async* {
      yield* _mapDeletedToState(execiseId, exercises);
    });
  }

  Stream<ExerciseHubState> _bindReorderedToState() async* {
    //TODO: implement reordered
  }
  Stream<ExerciseHubState> _mapAddedToState(
      Exercise exercise, List<Exercise> exerciseList) async* {
    yield ExerciseHubState.loaded(exercises: [exercise, ...exerciseList]);
  }

  Stream<ExerciseHubState> _mapDeletedToState(
      UniqueId exerciseId, List<Exercise> exerciseList) async* {
    yield ExerciseHubState.loaded(
        exercises: exerciseList
            .where((exercise) => exercise.id != exerciseId)
            .toList());
    final failureOrSuccess = await iExerciseFacade.deleteExercise(exerciseId);
    if (failureOrSuccess.isLeft()) {
      yield* failureOrSuccess.fold((failure) async* {
        yield ExerciseHubState.loaded(exercises: exerciseList);
        yield ExerciseHubState.loadedError(failure: ExerciseFailure.delete());
      }, (r) => null);
    }
  }
}
