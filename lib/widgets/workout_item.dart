import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 235, 205, 1),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
              child: Column(
                children: [
                  Text(
                    'High Stepping',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veniam modi accusamus voluptatum pariatur necessitatibus sequi exercitationem, labore quasi eum neque.'
                  )
                ],
              )
          ),
          Expanded(
              flex: 1,
              child: Image.asset('assets/fitness_image.png')
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
