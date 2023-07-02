import 'package:bee_fit/auth_layout.dart';
import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/hame_layout.dart';
import 'package:bee_fit/screens/about.dart';
import 'package:bee_fit/screens/appointment.dart';
import 'package:bee_fit/screens/bmi_calculator.dart';
import 'package:bee_fit/screens/faq.dart';
import 'package:bee_fit/screens/home.dart';
import 'package:bee_fit/screens/list_workour_plan.dart';
import 'package:bee_fit/screens/login.dart';
import 'package:bee_fit/screens/signup.dart';
import 'package:bee_fit/screens/workout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences.setMockInitialValues({});
  //
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final viewModel1 = Get.put(BeeLogic());
  // bool? isSignedIn = prefs.getBool('isSignedIn');
  // print(isSignedIn);
  // if(isSignedIn as bool){
  //   viewModel1.isSignedIn.value = true;
  //   viewModel1.emailAddressController.value.text = prefs.getString('email')!;
  //   viewModel1.passwordController.value.text = prefs.getString('password')!;
  //   viewModel1.signIn();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bee Fit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomeLayout(page: Home()),
        '/login': (context) =>  AuthLayout(page: Login()),
        '/signup': (context) =>  AuthLayout(page: SignUp()),
        '/workout': (context) => const HomeLayout(page: Workout()),
        '/hard-workout': (context) => const HomeLayout(page: ListWorkoutPlan(plan: 'hard')),
        '/easy-workout': (context) => const HomeLayout(page: ListWorkoutPlan(plan: 'easy')),
        '/bmi-calculator': (context) => HomeLayout(page: BmiCalculator()),
        '/faq': (context) => HomeLayout(page: Faq()),
        '/appointment': (context) => HomeLayout(page: Appointment()),
        '/about': (context) => const HomeLayout(page: About())
      },
    );
  }
}
