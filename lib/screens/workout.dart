import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Workout extends StatelessWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(190, 132, 54, 1)
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Choose your workout plan:', style: TextStyle(fontSize: 25, color: Colors.white)),
              Padding(
                  padding: const EdgeInsets.all(30),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          minWidth: 150,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            Get.toNamed('/easy-workout');
                          },
                          child: const Text('Easy', style: TextStyle(fontSize: 20.0)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          minWidth: 150,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                              Get.toNamed('/hard-workout');
                          },
                          child: const Text('Hard', style: TextStyle(fontSize: 20.0)),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
