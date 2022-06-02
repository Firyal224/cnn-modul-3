// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cnn_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    Future.delayed(const Duration(seconds: 2),() async {
    final prefs = await SharedPreferences.getInstance(); 
       if(prefs.getBool("isLogin") == true){
         Navigator.pushNamed(context, "/mainPage");
       } else {
         Navigator.pushNamed(context, "/login");
       }
    });
    super.initState();
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