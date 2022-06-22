// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cnn_app/main.dart';
import 'package:cnn_app/views/home_page/home_appbar_page.dart';
import 'package:cnn_app/views/home_page/populer_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   void showNotification() {
    flutterLocalNotificationsPlugin.show(
      0,
      "Apa gitu",
      "Hayo ngapain ?",
      NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name, channelDescription: channel.description,
          importance: Importance.high,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher')));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar:AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Container(
              margin: const EdgeInsets.only(top: 8),
              child: Image.asset('assets/CnnLogo.png',width: 60.0,height: 80.0,),
            ),
            actions:<Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      size: 28.0,
                    ),
                  )
              ),
            ],

            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Home",),
                Tab(text: "Fokus",),
                Tab(text: "Populer",),
                Tab(text: "Nasional",),

              ],
            )
          ),
          
          body:  TabBarView(
            children: [
              HomeAppBar(),
              PopulerAppBar(),
              HomeAppBar(),
              PopulerAppBar(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red.withOpacity(0.9),
            onPressed: ()=> showNotification(),
            child: Icon(Icons.notifications, color:Colors.white, size: 32),
          ),
        ),
      ),
    );
  }

  Widget cardBarView(String title) {
    return Text(title,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }
}