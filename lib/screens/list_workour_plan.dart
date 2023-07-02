import 'package:bee_fit/widgets/workout_item.dart';
import 'package:flutter/material.dart';

class ListWorkoutPlan extends StatelessWidget {
  final plan;
  const ListWorkoutPlan({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromRGBO(190, 132, 54, 1)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WorkoutItem(),
              WorkoutItem()
            ],
          ),
        ));
    ;
  }
}
