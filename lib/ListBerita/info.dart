// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class infoWidget extends StatelessWidget {
  final String title;
  final String content;
  const infoWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center,),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(content, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
