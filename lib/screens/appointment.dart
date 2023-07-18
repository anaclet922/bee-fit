import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/widgets/appointment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appointment extends StatelessWidget {

  Appointment({Key? key}) : super(key: key);


  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {


    if(viewModel.isSignedIn.value && viewModel.isAdmin.value){
      viewModel.getAppointments();
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'All Appointments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Obx(() =>
               Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.myAppointments.value.length,
                    itemBuilder: (context, index) => AppointmentItem(
                        appointment: viewModel.myAppointments.value[index],
                        index: index
                    ),
                  )
              ),
            )
          ],
        ),
      );
    }

    if(viewModel.isSignedIn.value){
      viewModel.assignNamesForSigned();
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(242, 242,242, 1),
                  image: const DecorationImage(
                      image: AssetImage('assets/man.png')
                  )
              ),
            ),
            const SizedBox(height: 10,),
            const Text('NAZMUL', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            const Text('NAZMUL@mail.com.my'),
            const SizedBox(height: 40,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('Full name'),
               TextField(
                 controller: viewModel.appointmentNameController.value,
                 decoration: InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                     contentPadding:
                     const EdgeInsets.fromLTRB(20, 5, 20, 5),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     hintText: 'Full Name'),
               ),
               const SizedBox(height: 10,),
               const Text('Phone Number'),
               TextField(
                 keyboardType: TextInputType.number,
                 controller: viewModel.appointmentPhoneController.value,
                 decoration: InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                     contentPadding:
                     const EdgeInsets.fromLTRB(20, 5, 20, 5),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     hintText: 'Enter your phone number'),
               ),
               const SizedBox(height: 10,),
               const Text('Email address'),
               TextField(
                 controller: viewModel.appointmentEmailController.value,
                 decoration: InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                     contentPadding:
                     const EdgeInsets.fromLTRB(20, 5, 20, 5),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     hintText: 'Enter your email'),
               ),
               const SizedBox(height: 10,),
               const Text('Topic'),
               TextField(
                 controller: viewModel.appointmentTopicController.value,
                 decoration: InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                     contentPadding:
                     const EdgeInsets.fromLTRB(20, 5, 20, 5),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     hintText: 'Enter your topic'),
               ),
               const SizedBox(height: 10,),
               Row(
                 children: [
                   Expanded(
                     child: Column(
                       children: [
                         const Text('Date'),
                         TextField(
                           readOnly: true,
                           controller: viewModel.appointmentDateController.value,
                           decoration: InputDecoration(
                               fillColor: Colors.white,
                               filled: true,
                               contentPadding:
                               const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                                     viewModel.appointmentDateController.value.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                                   }

                                 },
                                 child: const Icon(Icons.calendar_today_outlined),
                               )
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Expanded(
                       child: Column(
                         children: [
                           const Text('Time'),
                           TextField(
                             readOnly: true,
                             controller: viewModel.appointmentTimeController.value,
                             decoration: InputDecoration(
                                 fillColor: Colors.white,
                                 filled: true,
                                 contentPadding:
                                 const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(5),
                                 ),
                                 hintText: '--:--',
                                 suffixIcon: GestureDetector(
                                   onTap: () async{

                                     TimeOfDay? pickedTime = await showTimePicker(
                                         context: context,
                                        initialTime: TimeOfDay.now()
                                     );

                                     if(pickedTime != null ){
                                       viewModel.appointmentTimeController.value.text = '${pickedTime.hour}:${pickedTime.minute}';
                                     }

                                   },
                                   child: const Icon(Icons.watch_later_outlined),
                                 )
                             ),
                           ),
                         ],
                       )
                   )
                 ],
               ),
               const SizedBox(height: 10,),
               MaterialButton(
                 minWidth: double.infinity,
                 color: Colors.blueAccent,
                 textColor: Colors.white,
                 onPressed: () {
                   viewModel.saveAppointment();
                 },
                 child:const Padding(
                   padding:  EdgeInsets.all(10.0),
                   child:  Text('Book appointment', style: TextStyle(fontSize: 20.0)),
                 ),
               )
             ],
           )
          ],
        ),
      ),
    );
  }
}
