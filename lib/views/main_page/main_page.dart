// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cnn_app/main.dart';
import 'package:cnn_app/views/home_page/home_page.dart';
import 'package:cnn_app/views/profile_page/profile_page.dart';
import 'package:cnn_app/views/tv_page/tv_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late SharedPreferences preferences;
  late TabController _tabController;
  bool loadData = true;
  final List<Widget> list = [
    Tab(icon: Icon(Icons.home, color: Colors.grey, size: 26,), text: "HOME",),
    Tab(icon: Icon(Icons.tv_sharp, color: Colors.grey,size: 26,), text: "CNN TV",),
    Tab(
      icon: ImageIcon(
        AssetImage("assets/profile.png"),
        color: Colors.black38,
        size: 23,), 
      text: "PROFILE",
    ),
  ];


  @override
  void initState() {
    super.initState();
     _tabController = TabController(length: list.length, vsync: this);
     getDataUser().then((value) {
       setState(() {
         loadData = false;
       });
     });

     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription:channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  Future getDataUser() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


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
    return Scaffold(
      body:loadData ? Center(child: CircularProgressIndicator()) :  SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: TabBarView(
          controller: _tabController,
          children:  [
            HomePage(),
            TvPage(),
            ProfilePage(
              nama: preferences.getString("nama").toString(),
              nim: preferences.getString("nim").toString(),
            ),
          ]
        ),
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.black,
        onTap: (index) {},
        controller: _tabController,
        tabs: list, 
        indicatorColor: Colors.grey.withOpacity(0.1),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.withOpacity(0.9),
        onPressed: ()=> showNotification(),
        child: Icon(Icons.notifications, color:Colors.white, size: 32),
      ),
    );
  }
}