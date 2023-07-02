import 'package:bee_fit/widgets/left_drawer.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final Widget page;
  const HomeLayout({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: LeftDrawer(),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: Row(
          children: [
            const Text(
              'BEE',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            const Text(
              'FIT',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/logo.png',
              width: 25,
            )
          ],
        )),
        body: page);
  }
}
