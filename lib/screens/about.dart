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
          const Expanded(
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Fitness is a very important issue for a human being. Mental happiness cannot be achieved without proper physical health. Without a sound health and fitness, people cannot be truly happy and healthy. But it is seen that most of the people do not take physical fitness seriously. Also, people do not have time or are lazy to go to the gym and do some exercises.  Besides, people cannot find an expert trainer for taking proper advice. Also, it is hard for a single trainer to provide training physically to a great number of people. So we are making a solution for them through our mobile application . Our stakeholder is an expert trainer. We are introducing “Bee Fit”, a complete fitness solution for people. By using it, people can select a plan and do the exercises that are given by the expert  trainer. People can also get a balanced diet according to their BMI.(Basic Metabolic Index) Our mobile application will give daily reminders to its users for workouts. The users can also book an online appointment with the trainer by doing advance payment online. As such, the users of our system can do exercises prescribed by a professional fitness trainer anytime they want. Besides, they can also maintain a proper diet that is beneficial for them according to their weight. Our mobile application will select the best set of exercises for the user according to his/her weight and height.  We hope that our mobile application will be able to make people aware of the importance of fitness and also hope that it will be successful in making people healthy and fit.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
