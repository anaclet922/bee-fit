import 'package:bee_fit/bee_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiCalculator extends StatelessWidget {
   BmiCalculator({Key? key}) : super(key: key);

  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(190, 132, 54, 1)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('BMI Calculator',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: viewModel.heightEditingController.value,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Enter Your Height In Meters'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  controller: viewModel.weightEditingController.value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Enter Your Weight In Kilograms'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: const Color.fromRGBO(255, 99, 71, 1),
                  textColor: Colors.black,
                  onPressed: () {
                    viewModel.calculateBmi();
                  },
                  child: const Text('Calculate BMI',
                      style: TextStyle(fontSize: 20.0)),
                ),
              ),
              Obx(() =>
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(255, 255, 0, 1)),
                  child: Text('BMI value: ${viewModel.bmi.value.toStringAsFixed(2)} kg/m\u00B2'),
                ),
              ),
              Obx(() =>
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(127, 255, 212, 1)),
                  child: Text(viewModel.bmiStatus.value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: const Color.fromRGBO(255, 99, 71, 1),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back', style: TextStyle(fontSize: 20.0)),
                ),
              ),
            ],
          ),
        ));
  }
}
