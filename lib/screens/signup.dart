import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SignUp extends StatelessWidget {

  SignUp({Key? key}) : super(key: key);

  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(),
              ),
              TextField(
                controller: viewModel.signUpNameController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Name'),
              ),
              const Text(
                'Date of Birth',
                style: TextStyle(),
              ),
              Obx(() =>
                TextField(
                  controller: viewModel.signUpDobController.value,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'dd/mm/yyyy',
                      suffixIcon: GestureDetector(
                        onTap: () async{

                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            viewModel.signUpDobController.value.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          }

                        },
                        child: const Icon(Icons.calendar_today_outlined),
                      )
                  ),

                ),
              ),
              const Text(
                'Weight',
                style: TextStyle(),
              ),
              TextField(
                controller: viewModel.signUpWeightController.value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Weight'),
              ),
              const Text(
                'Height',
                style: TextStyle(),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: viewModel.signUpHeightController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Height'),
              ),
              const Text(
                'Phone Number',
                style: TextStyle(),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: viewModel.signUpPhoneController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Phone Number'),
              ),
              const Text(
                'Email',
                style: TextStyle(),
              ),
              TextField(
                controller: viewModel.signUpEmailController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Email'),
              ),
              const Text(
                'Password',
                style: TextStyle(),
              ),
              TextField(
                obscureText: true,
                controller: viewModel.signUpPasswordController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Password'),
              ),
              const Text(
                'Password confirmation',
                style: TextStyle(),
              ),
              TextField(
                obscureText: true,
                controller: viewModel.signUpCPasswordController.value,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Password confirmation'),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  viewModel.createUser();
                },
                child:
                const Text('DONE', style: TextStyle(fontSize: 20.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
