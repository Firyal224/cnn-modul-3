import 'package:flutter/material.dart';
import 'package:cnn/services/routes.dart';
void main() {
  runApp(const MaterialApp(
    //  debugShowCheckedModeBanner -> digunakan untuk menonaktifkan tulisan mode DEBUG

    debugShowCheckedModeBanner: false,

    // onGenerateRoute -> digunakan untuk menginisialisasikan routing saat aplikasi pertama kali dijalankan

    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}