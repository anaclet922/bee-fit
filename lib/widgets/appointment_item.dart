import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/models/appontment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentItem extends StatelessWidget {
  final AppointmentModel appointment;
  final int index;
   AppointmentItem({Key? key, required this.appointment, required this.index}) : super(key: key);

  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${index+1} - ${appointment.name}', style: const TextStyle(fontWeight: FontWeight.w600),),
                    Text(appointment.phone),
                    Text(appointment.email),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${appointment.date} ${appointment.time}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                    ),
                    MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                          Get.dialog(
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.all(40),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(241, 194, 50, 1),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.warning, color: Colors.red,),
                                      const Text(
                                        'Are you sure to delete?',
                                        style: TextStyle(
                                          fontSize: 18,
                                          decoration: TextDecoration.none
                                        ),
                                      ),
                                      const SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                              color: Colors.blueAccent,
                                              textColor: Colors.white,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child:
                                              const Text('No', style: TextStyle(fontSize: 20.0)),
                                            ),
                                          ),
                                          const SizedBox(width: 15,),
                                         Expanded(
                                           child: MaterialButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              viewModel.deleteAppoint(appointment.id);
                                            },
                                            child:
                                            const Text('Yes', style: TextStyle(fontSize: 20.0)),
                                          )
                                         )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );
                      },
                      child: const Text('Delete', style: TextStyle(fontSize: 16.0)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}
