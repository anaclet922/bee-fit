import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  final String title;
  final String body;

  const FaqItem({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  
  bool isExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  )
              ),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(isExpanded ? Icons.minimize_outlined : Icons.add)
              )
            ],
          ),
          if(isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                  widget.body,
                  style: TextStyle(
                    fontSize: 16
                  ),
              ),
            )
        ],
      ),
    );
  }
}
