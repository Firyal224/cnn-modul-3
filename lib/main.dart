// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';

import 'package:cnn_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    title: "CNN INDONESIA",

    //  debugShowCheckedModeBanner -> digunakan untuk menonaktifkan tulisan mode DEBUG

    debugShowCheckedModeBanner: false,

    // onGenerateRoute -> digunakan untuk menginisialisasikan routing saat aplikasi pertama kali dijalankan

    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
        FirebaseAuth.instance.userChanges().listen((user) {
            if(user == null){
               Navigator.pushNamed(context, "/login");
            }else{
              Navigator.pushNamed(context, "/mainPage");
            }
        });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red[900],
          image: DecorationImage(
            image: AssetImage("assets/CnnLogo.png"),
          ),
        ),
      )
    );
  }
}