import 'package:bee_fit/bee_logic.dart';
import 'package:bee_fit/widgets/faq_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Faq extends StatelessWidget {

  Faq({Key? key}) : super(key: key);

  final viewModel = Get.put(BeeLogic());

  @override
  Widget build(BuildContext context) {

    viewModel.readFaqs();

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const Text('FAQ', textAlign: TextAlign.center,style: TextStyle(fontSize: 25, color: Colors.white)),
            Obx(() =>
              Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.faqs.value.length,
                    itemBuilder: (context, index) => FaqItem(
                        title: viewModel.faqs.value[index].title, body: viewModel.faqs.value[index].body
                    ),
                  )
              ),
            )
          ],
        )
    );;
  }
}
