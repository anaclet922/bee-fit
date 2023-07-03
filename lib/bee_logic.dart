import 'package:bee_fit/models/appontment.dart';
import 'package:bee_fit/models/faq.dart';
import 'package:bee_fit/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class BeeLogic extends GetxController {
  Rx<TextEditingController> heightEditingController =
      TextEditingController().obs;
  Rx<TextEditingController> weightEditingController =
      TextEditingController().obs;

  // sign in
  Rx<TextEditingController> emailAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  // signup
  Rx<TextEditingController> signUpNameController = TextEditingController().obs;
  Rx<TextEditingController> signUpDobController = TextEditingController().obs;
  Rx<TextEditingController> signUpWeightController =
      TextEditingController().obs;
  Rx<TextEditingController> signUpHeightController =
      TextEditingController().obs;
  Rx<TextEditingController> signUpPhoneController = TextEditingController().obs;
  Rx<TextEditingController> signUpEmailController = TextEditingController().obs;
  Rx<TextEditingController> signUpPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> signUpCPasswordController =
      TextEditingController().obs;

  //appointment
  Rx<TextEditingController> appointmentNameController =
      TextEditingController().obs;
  Rx<TextEditingController> appointmentPhoneController =
      TextEditingController().obs;
  Rx<TextEditingController> appointmentEmailController =
      TextEditingController().obs;
  Rx<TextEditingController> appointmentTopicController =
      TextEditingController().obs;
  Rx<TextEditingController> appointmentDateController =
      TextEditingController().obs;
  Rx<TextEditingController> appointmentTimeController =
      TextEditingController().obs;

  RxDouble bmi = 0.0.obs;
  RxString bmiStatus = ''.obs;

  var db = FirebaseFirestore.instance;

  RxList<FaqModel> faqs = <FaqModel>[].obs;
  RxList<AppointmentModel> myAppointments = <AppointmentModel>[].obs;

  RxBool isSignedIn = false.obs;
  RxBool isAdmin = false.obs;
  RxString signedInName = ''.obs;
  RxBool rememberMe = true.obs;

  void calculateBmi() {
    double height =
        double.parse(heightEditingController.value.text.toString());
    double weight = double.parse(weightEditingController.value.text.toString());
    double b = weight / (height * height);
    bmi.value = b;

    if (b > 18.9) {
      bmiStatus.value = 'Under weight';
    } else if (b >= 19 && b <= 24.9) {
      bmiStatus.value = 'Normal weight';
    } else if (b >= 25 && b <= 29.9) {
      bmiStatus.value = 'Over weight';
    } else if (b >= 30 && b <= 34.9) {
      bmiStatus.value = '1\u02e2\u1d57 Level of Obesity';
    }  else if (b >= 35 && b <= 39.9) {
      bmiStatus.value = '2\u207f\u1d48 Level of Obesity';
    } else if (b >= 40) {
      bmiStatus.value = '3\u02b3\u1d48 Level of Obesity (Life is at risk)';
    }
  }

  void readFaqs() async {
    faqs.value = <FaqModel>[];
    try {
      await db.collection("faqs").get().then((event) {
        for (var doc in event.docs) {
          FaqModel f = FaqModel(
              id: doc.id, title: doc.data()['title'], body: doc.data()['body']);
          faqs.add(f);
        }
      });
    } on Exception {
      Get.snackbar('Error', 'Network connection fail!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void createUser() async {
    if (signUpPasswordController.value.text !=
        signUpCPasswordController.value.text) {
      Get.snackbar('Error', 'Password must match.',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else if (!validateEmail(signUpEmailController.value.text)) {
      Get.snackbar('Error', 'Invalid email.',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpEmailController.value.text.toString().trim(),
          password: signUpPasswordController.value.text,
        );

        final user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          UserModel u = UserModel(
              id: user.uid,
              name: signUpNameController.value.text,
              dob: signUpDobController.value.text,
              weight: signUpWeightController.value.text,
              height: signUpHeightController.value.text,
              phone: signUpPhoneController.value.text,
              email: signUpEmailController.value.text,
              role: 'user');

          CollectionReference users =
              FirebaseFirestore.instance.collection('users');
          users.doc(u.id).set(u.toJson());
          Get.snackbar('Success', 'Account created',
              backgroundColor: Colors.green, colorText: Colors.white);
          isSignedIn.value = true;
          signedInName.value = u.name;

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isSignedIn', true);
          await prefs.setString('email', signUpEmailController.value.text);
          await prefs.setString(
              'password', signUpPasswordController.value.text);

          Get.toNamed('/');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.',
              backgroundColor: Colors.red, colorText: Colors.white);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.',
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } on Exception catch (e) {
        print(e);
        Get.snackbar('Error', 'Network connection fail, try again!',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  void signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddressController.value.text,
          password: passwordController.value.text);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.snackbar('Success', 'Successfully signed in!',
            backgroundColor: Colors.green, colorText: Colors.black);
        isSignedIn.value = true;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isSignedIn', true);
        await prefs.setString('email', emailAddressController.value.text);
        await prefs.setString('password', passwordController.value.text);

        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        final snapshot = await users.doc(user.uid).get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          signedInName.value = data['name'];
          isAdmin.value = data['role'] == 'user' ? false : true;
          Get.toNamed('/');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  void logout() async {
    isSignedIn.value = false;
    isAdmin.value = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    await prefs.setString('email', '');
    await prefs.setString('password', '');
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/');
  }

  void changeRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void saveAppointment() {
    if (appointmentNameController.value.text.isNotEmpty &&
        appointmentPhoneController.value.text.isNotEmpty &&
        appointmentEmailController.value.text.isNotEmpty &&
        appointmentTopicController.value.text.isNotEmpty &&
        appointmentDateController.value.text.isNotEmpty &&
        appointmentTimeController.value.text.isNotEmpty) {
      try {
        AppointmentModel appointmentModel = AppointmentModel(
            id: const Uuid().v1(),
            name: appointmentNameController.value.text,
            phone: appointmentPhoneController.value.text,
            email: appointmentEmailController.value.text,
            topic: appointmentTopicController.value.text,
            date: appointmentDateController.value.text,
            time: appointmentTimeController.value.text);

        CollectionReference users =
            FirebaseFirestore.instance.collection('appointments');
        users.doc(appointmentModel.id).set(appointmentModel.toJson());
        Get.snackbar('Success', 'Appointments booked!',
            backgroundColor: Colors.green, colorText: Colors.white);
        appointmentNameController.value.text = '';
        appointmentPhoneController.value.text = '';
        appointmentEmailController.value.text = '';
        appointmentTopicController.value.text = '';
        appointmentDateController.value.text = '';
        appointmentTimeController.value.text = '';
      } on Exception {
        Get.snackbar('Error', 'Booking appointment fail, try again!',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error', 'All fields are required!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void getAppointments() async{
    try {
      CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');
      final snapshot = await appointments.get();
      if (snapshot.docs.isNotEmpty) {
        myAppointments.value = [];
        for(var a in snapshot.docs){
          AppointmentModel appointmentModel = AppointmentModel(
              id: a['id'],
              name: a['name'],
              phone: a['phone'],
              email: a['email'],
              topic: a['topic'],
              date: a['date'],
              time: a['time']
          );
          myAppointments.value.add(appointmentModel);
        }
      }

    } on Exception {
      Get.snackbar('Error', 'No connection!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void deleteAppoint(String id){
    FirebaseFirestore.instance.collection('appointments').doc(id).delete();
    Get.snackbar('Success', 'Deleted Successfully!',
        backgroundColor: Colors.green, colorText: Colors.white);
    getAppointments();
  }

}
