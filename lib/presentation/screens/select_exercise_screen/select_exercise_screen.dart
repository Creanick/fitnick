import 'package:fitnick/application/exercise/exercise_hub/exercise_hub_bloc.dart';
import 'package:fitnick/application/exercise/filtered_exercise/filtered_exercise_bloc.dart';
import 'package:fitnick/domain/exercise/models/exercise.dart';
import 'package:fitnick/domain/exercise/models/sub_models/exercise_level.dart';
import 'package:fitnick/domain/exercise/models/sub_models/exercise_target.dart';
import 'package:fitnick/domain/exercise/models/sub_models/exercise_tool.dart';
import 'package:fitnick/domain/exercise/models/sub_models/exercise_type.dart';
import 'package:fitnick/presentation/core/widgets/search_bar.dart';
import 'package:fitnick/presentation/screens/exercise_filter_screen/exercise_filter_screen.dart';
import 'package:fitnick/presentation/screens/home/widgets/exercise/exercise_item.dart';
import 'package:fitnick/presentation/screens/home/widgets/exercise/exercise_item_type.dart';
import 'package:fitnick/presentation/screens/select_exercise_screen/widgets/removable_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectExerciseScreen extends StatefulWidget {
  static const String routeName = "/select_exercise";

  const SelectExerciseScreen({Key key}) : super(key: key);
  static Widget generateRoute(
    BuildContext context,
  ) {
    return BlocProvider<FilteredExerciseBloc>(
      create: (_) => FilteredExerciseBloc(
          exerciseHubBloc: BlocProvider.of<ExerciseHubBloc>(context)),
      child: SelectExerciseScreen(),
    );
  }

  @override
  _SelectExerciseScreenState createState() => _SelectExerciseScreenState();
}

class _SelectExerciseScreenState extends State<SelectExerciseScreen> {
  List<Exercise> _selectedExerciseList;
  @override
  void initState() {
    super.initState();
    _selectedExerciseList = [];
  }

  void _addSelectedExercise(Exercise exercise) {
    setState(() {
      _selectedExerciseList.add(exercise);
    });
  }

  void _removeSelectedExercise(Exercise exercise) {
    setState(() {
      _selectedExerciseList.removeWhere((e) => e.id == exercise.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredExerciseBloc, FilteredExerciseState>(
      builder: (_, state) => Scaffold(
          appBar: AppBar(
            title: Text("Select Exercise"),
            actions: <Widget>[
              buildFilterButton(context),
              buildDoneButton(context)
            ],
          ),
          body: Builder(
            builder: (_) {
              if (state.isLoading) {
                return buildLoading();
              }
              return state.exercises.fold(
                  () => buildNoExercise(),
                  (List<Exercise> exercises) =>
                      buildLoaded(context, exercises, state.searchTerm));
            },
          )),
    );
  }

  Widget buildFilterButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ExerciseFilterScreen.generateRoute(
              BlocProvider.of<FilteredExerciseBloc>(context)),
        ));
      },
    );
  }

  Widget buildNoExercise() {
    return Center(child: Text("No Exercises Available"));
  }

  Widget buildLoaded(
      BuildContext context, List<Exercise> exercises, String searchTerm) {
    return Stack(
      children: <Widget>[
        buildExerciseList(context, exercises, searchTerm),
      ],
    );
  }

  Widget buildExerciseList(
      BuildContext context, List<Exercise> exercises, String searchTerm) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return buildListHeader(searchTerm, context);
        }
        final realIndex = index - 1;
        final exercise = exercises[realIndex];
        return Container(
          margin: EdgeInsets.all(10),
          child: ExerciseItem(
            exercise: exercise,
            exerciseItemType: ExerciseItemType.selectable(
                onSelect: (selected) {
                  if (selected) {
                    _addSelectedExercise(exercise);
                  } else {
                    _removeSelectedExercise(exercise);
                  }
                },
                selected: false),
          ),
        );
      },
      itemCount: exercises.length + 1,
    );
  }

  Widget buildListHeader(String searchTerm, BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: SearchBar(
            value: searchTerm,
            onChanged: (value) {
              BlocProvider.of<FilteredExerciseBloc>(context)
                  .add(FilteredExerciseEvent.searched(term: value));
            },
          ),
        ),
        buildFilterChips(context)
      ],
    );
  }

  Widget buildFilterChips(BuildContext context) {
    return BlocBuilder<FilteredExerciseBloc, FilteredExerciseState>(
      builder: (_, state) {
        print(state.filteredExercise.levels);
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            ...state.filteredExercise.levels.map((level) => RemovableChip(
                  title: level.name,
                  color: Colors.orange,
                  onRemove: () {
                    onLevelRemoved(state, level, context);
                  },
                )),
            ...state.filteredExercise.tools.map((e) => RemovableChip(
                  title: e.name,
                  color: Colors.green,
                  onRemove: () => onToolRemoved(state, e, context),
                )),
            ...state.filteredExercise.types.map((e) => RemovableChip(
                  title: e.name,
                  color: Colors.purple,
                  onRemove: () => onTypeRemoved(state, e, context),
                )),
            ...state.filteredExercise.primaryTargets.map((e) => RemovableChip(
                  title: e.name,
                  color: Colors.teal,
                  onRemove: () => onPrimaryTargetRemoved(state, e, context),
                )),
            ...state.filteredExercise.secondaryTargets.map((e) => RemovableChip(
                  title: e.name,
                  color: Colors.brown,
                  onRemove: () => onSecondaryTargetRemoved(state, e, context),
                )),
          ],
        );
      },
    );
  }

  void onLevelRemoved(
      FilteredExerciseState state, ExerciseLevel level, BuildContext context) {
    final newLevels = [...state.filteredExercise.levels];
    newLevels.remove(level);
    _onChipRemoved(context, state.filteredExercise.copyWith(levels: newLevels));
  }

  void onToolRemoved(
      FilteredExerciseState state, ExerciseTool tool, BuildContext context) {
    final newList = [...state.filteredExercise.tools];
    newList.remove(tool);
    _onChipRemoved(context, state.filteredExercise.copyWith(tools: newList));
  }

  void onTypeRemoved(
      FilteredExerciseState state, ExerciseType type, BuildContext context) {
    final newList = [...state.filteredExercise.types];
    newList.remove(type);
    _onChipRemoved(context, state.filteredExercise.copyWith(types: newList));
  }

  void onPrimaryTargetRemoved(FilteredExerciseState state,
      ExerciseTarget target, BuildContext context) {
    final newList = [...state.filteredExercise.primaryTargets];
    newList.remove(target);
    _onChipRemoved(
        context, state.filteredExercise.copyWith(primaryTargets: newList));
  }

  void onSecondaryTargetRemoved(FilteredExerciseState state,
      ExerciseTarget target, BuildContext context) {
    final newList = [...state.filteredExercise.secondaryTargets];
    newList.remove(target);
    _onChipRemoved(
        context, state.filteredExercise.copyWith(secondaryTargets: newList));
  }

  void _onChipRemoved(BuildContext context, Exercise exercise) {
    BlocProvider.of<FilteredExerciseBloc>(context)
        .add(FilteredExerciseEvent.filtered(exercise));
  }

  Widget buildDoneButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context, _selectedExerciseList),
      icon: Icon(Icons.check),
    );
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildLoadedError(_) {
    return Text("Exercise Loaded Error , Try again ");
  }
}
