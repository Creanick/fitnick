import 'package:dartz/dartz.dart';
import 'package:fitnick/domain/active_workout/models/active_workout.dart';
import 'package:fitnick/presentation/core/helpers/show_message.dart';
import 'package:fitnick/presentation/screens/active_workout_form/active_workout_form_screen.dart';
import 'package:flutter/material.dart';

class ActiveWorkoutItem extends StatelessWidget {
  final ActiveWorkout activeWorkout;

  const ActiveWorkoutItem({Key key, @required this.activeWorkout})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: ListTile(
        title: Text(activeWorkout.name.safeValue),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 0) {
              _onEdit(context);
            } else if (value == 1) {
              _onDelete();
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Edit"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Delete"),
                value: 1,
              ),
            ];
          },
        ),
      ),
    );
  }

  void _onEdit(BuildContext context) async {
    final String message = await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) =>
          ActiveWorkoutFormScreen.generateRoute(Some(activeWorkout)),
    ));
    if (message != null) {
      showMessage(context, message: message, type: SuccessMessage());
    }
  }

  void _onDelete() {}
}