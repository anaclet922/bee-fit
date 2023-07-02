import 'package:bee_fit/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
  final Widget page;
  const AuthLayout({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.yellowAccent[200],
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fitness_image.png'),
                fit: BoxFit.contain
            )
        ),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: page,
      ),
    );
  }
}
