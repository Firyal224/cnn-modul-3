// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables

import 'package:cnn_app/model/dummy_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future validateLogin() async {
  final prefs = await SharedPreferences.getInstance();
   DummyData.data.forEach((element) async {
     if(element["username"] == usenameController.text && element["password"] == passwordController.text){
       if(element.isNotEmpty){
         prefs.setBool("isLogin", true);
         prefs.setString("nama", element["nama"].toString());
         prefs.setString("nim", element["Nim"].toString());
         Navigator.pushNamed(context, "/mainPage");
       } else {
         debugPrint("NO HAVE DATA");
       }
     } 
    });
  }

  Future login() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usenameController.text.trim(), 
      password: passwordController.text.trim()
      );
    }on FirebaseAuthException catch (e){
        print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: <Widget>[
            const Text(
              'Sign in',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    controller: usenameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      prefixIcon  : const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: false,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async  {
                     login();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not registered yet?'),
                      TextButton(
                        onPressed: () {

                        },

                        
                        child: GestureDetector(
                          onTap: () =>  Navigator.pushNamed(context, "/register"),
                          child: 
                          const Text(
                            'Create an account'
                            )
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}