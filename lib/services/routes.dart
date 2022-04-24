import 'package:flutter/material.dart';
import 'package:cnn/views/populer.dart';
import 'package:cnn/views/login.dart';
import 'package:cnn/views/home_page.dart';
import 'package:cnn/views/profil.dart';
import 'package:cnn/views/populer.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument -> final args = settings.arguments; 

    switch (settings.name) {    
      // Disini arguument setting.name -> sebagai nama halaman yang nanti akan dipanggil saat navigasi
      // Dan argument title -> sebagai judul halaman
        
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage(title: "Home",));
      case '/':
        return MaterialPageRoute(builder: (_) => const login(title: "login",));
      case '/populer':
        return MaterialPageRoute(builder: (_) => const PopulerPage(title: "Hot News: Bank bla blas Bla bla",));
      case '/profil':
        return MaterialPageRoute(builder: (_) => const Profil(title: "profil",));
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