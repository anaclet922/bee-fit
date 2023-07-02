import 'package:bee_fit/bee_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum Services { workout, diet, bMI, appointment }

class LeftDrawer extends StatelessWidget {

  LeftDrawer({Key? key}) : super(key: key);
  final viewModel = Get.put(BeeLogic());

  Services? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        // backgroundColor: kSecondaryColor,
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            Expanded(
                child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BEE',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Text(
                      'FIT',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 30,
                    )
                  ],
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('home', style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.toNamed('/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About', style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Get.toNamed('/about');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list_alt),
                  title: Row(
                    children: [
                      const Text('Services', style: TextStyle(fontSize: 16.0)),
                      PopupMenuButton<Services>(
                        initialValue: selectedMenu,
                        // Callback that sets the selected popup menu item.
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        onSelected: (Services item) {
                          switch(item){
                            case Services.workout:{
                              Navigator.of(context).pop();
                              Get.toNamed('/workout');
                            }break;
                            case Services.diet:{
                              Navigator.of(context).pop();
                              Get.toNamed('/die');
                            }break;
                            case Services.bMI:{
                              Navigator.of(context).pop();
                              Get.toNamed('/bmi-calculator');
                            }break;
                            case Services.appointment:{
                              Navigator.of(context).pop();
                              Get.toNamed('/appointment');
                            }break;
                            default: {
                              Navigator.of(context).pop();
                            }break;
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<Services>>[
                          const PopupMenuItem<Services>(
                            value: Services.workout,
                            child:  Text('Workout')
                          ),
                          const PopupMenuItem<Services>(
                            value: Services.diet,
                            child: Text('Diet'),
                          ),
                          const PopupMenuItem<Services>(
                            value: Services.bMI,
                            child: Text('BMI Calculator'),
                          ),
                          const PopupMenuItem<Services>(
                            value: Services.appointment,
                            child: Text('Appointment of trainer'),
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.question_mark),
                  title: const Text('FAQ', style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.toNamed('/faq');
                  },
                ),
                const Divider(),
                if(!viewModel.isSignedIn.value)
                ListTile(
                  title:  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.yellow,
                    textColor: Colors.black,
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: const Text('LOGIN', style: TextStyle(fontSize: 20.0)),
                  ),
                  onTap: () {},
                ),
                if(!viewModel.isSignedIn.value)
                ListTile(
                  title: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.yellow,
                    textColor: Colors.black,
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: const Text('SIGN UP', style: TextStyle(fontSize: 20.0)),
                  ),
                  onTap: () {},
                ),
                if(viewModel.isSignedIn.value)
                  ListTile(
                    title: const Text('You signed in as', style: TextStyle(fontSize: 20.0)),
                    onTap: () {},
                  ),
                if(viewModel.isSignedIn.value)
                  ListTile(
                    title: Text(viewModel.signedInName.value, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                if(viewModel.isSignedIn.value)
                  ListTile(
                    title: MaterialButton(
                      minWidth: double.infinity,
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        viewModel.logout();
                      },
                      child: const Text('Logout', style: TextStyle(fontSize: 20.0)),
                    ),
                    onTap: () {},
                  ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
