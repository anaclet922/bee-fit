import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {

   Login({Key? key}) : super(key: key);

  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'BEE FIT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 50,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: viewModel.emailAddressController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: viewModel.passwordController.value,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Obx(() =>
                    Checkbox(
                        value: viewModel.rememberMe.value,
                        onChanged: (bool? value) {
                            viewModel.changeRememberMe();
                        }
                    ),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  viewModel.signIn();
                },
                child: const Text('SIGN IN', style: TextStyle(fontSize: 20.0)),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: const Text('SIGN UP', style: TextStyle(fontSize: 20.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
