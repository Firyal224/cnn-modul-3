// ignore_for_file: prefer_const_constructors

import 'package:cnn_app/main.dart';
import 'package:cnn_app/views/auth/login_page.dart';
import 'package:cnn_app/views/auth/register_page.dart';
import 'package:cnn_app/views/main_page/main_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument -> final args = settings.arguments; 

    switch (settings.name) {    
      // Disini arguument setting.name -> sebagai nama halaman yang nanti akan dipanggil saat navigasi

      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/mainPage':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error"), automaticallyImplyLeading: false,),
        body: const Center(child: Text('Error page')),
      );
    });
  }
}