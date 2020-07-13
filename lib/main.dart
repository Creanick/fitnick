import 'package:fitnick/application/exercise/exercise_actor/exercise_actor_bloc.dart';
import 'package:fitnick/application/exercise/exercise_hub/exercise_hub_bloc.dart';
import 'package:fitnick/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/workout/workout_hub/workout_hub_bloc.dart';
import 'presentation/core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ExerciseHubBloc>(
        create: (_) => locator<ExerciseHubBloc>()..add(ExerciseHubEvent.init()),
      ),
      BlocProvider<ExerciseActorBloc>(
        create: (_) => locator<ExerciseActorBloc>(),
      ),
      BlocProvider<WorkoutHubBloc>(
        create: (_) => locator<WorkoutHubBloc>()..add(WorkoutHubEvent.init()),
      ),
    ],
    child: App(),
  ));
}
