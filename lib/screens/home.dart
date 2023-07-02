import 'package:bee_fit/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(60, 92, 102, 1)),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fitness_image.png'),
                  fit: BoxFit.contain
              )
          ),
          child: Container(
            color: const Color.fromRGBO(33, 150, 243, 0.4),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('JOIN US',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Find the best way to stay fit and healthy',
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Colors.yellow,
                    textColor: Colors.black,
                    onPressed: () {
                      Get.toNamed('/about');
                    },
                    child:
                        const Text('LEARN MORE', style: TextStyle(fontSize: 20.0)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
