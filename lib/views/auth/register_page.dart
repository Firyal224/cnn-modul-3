// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables

import 'package:cnn_app/model/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future validateRegister() async {
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
              'Sign Up',
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
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      prefixIcon  : const Icon(Icons.people_alt),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: usenameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
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
                     
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Register',
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
                      const Text('Have Account ?'),
                      TextButton(
                        onPressed: () {

                        },
                        child:GestureDetector(
                          onTap: () =>  Navigator.pushNamed(context, "/login"),
                          child: 
                          const Text(
                            'Login'
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