// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cnn_app/views/home_page/home_appbar_page.dart';
import 'package:cnn_app/widget/card.dart';
import 'package:flutter/material.dart';

class PopulerAppBar extends StatelessWidget {
  const PopulerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //Untuk scroll
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                    CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                    CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg"),
                    CardCustom(title: "Liga 1: Persipura Janji Habis-Habisan Lawan", time: "16 menit yang lalu", picture: "metropolitan.jpg")
                  ],
                ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}