import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'About',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const Text(
            'Fitness is a very important issue for a human being. Mental happiness cannot be achieved without proper physical health. Without a sound health and fitness, people cannot be truly happy and healthy. But it is seen that most of the people do not take physical fitness seriously. Also, people do not have time or are lazy to go to the gym and do some exercises.  Besides, people cannot find an expert trainer for taking proper advice. Also, it is hard for a single trainer to provide training physically to a great number of people.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: MaterialButton(
              minWidth: double.infinity,
              color: const Color.fromRGBO(255, 99, 71, 1),
              textColor: Colors.black,
              onPressed: () {
                Get.toNamed('/');
              },
              child: const Text('Back',
                  style: TextStyle(fontSize: 17.0, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
