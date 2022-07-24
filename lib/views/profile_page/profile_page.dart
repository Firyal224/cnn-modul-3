// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cnn_app/session_key.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "";

  @override
  void initState(){
    init();
    super.initState();
  }

  Future init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email =  prefs.getString("email")!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:18.0, top: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                       AssetImage("assets/ava.jpg"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 16,),
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( 
                        // SharedPreferences preferences = await SharedPreferences.getInstance();
                        //   await preferences.clear();
                        //     Navigator.pushAndRemoveUntil(
                        //     context,
                        //     PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                        //         Animation secondaryAnimation) {
                        //       return SplashScreen();
                        //     }, transitionsBuilder: (BuildContext context, Animation<double> animation,
                        //         Animation<double> secondaryAnimation, Widget child) {
                        //       return  SlideTransition(
                        //         position:  Tween<Offset>(
                        //           begin: const Offset(1.0, 0.0),
                        //           end: Offset.zero,
                        //         ).animate(animation),
                        //         child: child,
                        //       );
                        //     }),
                        //   (Route route) => false);
                       email,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                ),
               )
              ],
              ),

              SizedBox(height: 50,),
              Column(
                children: [
                  SizedBox(
                    child: ListTile(
                      title: Text("Kritik dan Saran",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("Bantu kami meningkatkan kualitas dan konten kami melalui kritik dan saran anda",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      trailing: Icon(Icons.mail),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    child: ListTile(
                      title: Text("Beri Penilaian",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("Bantu kami meningkatkan kualitas dan konten kami dengan memberikan Rating & Review di Google Play Store .",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                       trailing: Icon(Icons.star),
                       onTap: (){
                        print(SessionKey.accessToken);
                       },
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    child: ListTile(
                      title: Text("Tentang CNN INDONESIA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("Informasi mengenai copyright & versi Aplikasi",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      trailing: Icon(Icons.info, size: 26,),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    child: ListTile(
                      title: Text("Keluar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text("Keluar dari akun saat ini",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      trailing: Icon(Icons.logout, size: 26,),
                      onTap: ()  {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}