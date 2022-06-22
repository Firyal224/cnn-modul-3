// ignore_for_file: unused_import, unnecessary_import

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

initializaNotificatioon() async{
  final fcm = FirebaseMessaging.instance;
  debugPrint(
    "Token : ${(await FirebaseMessaging.instance.getToken())}");

  FirebaseMessaging.onMessage.listen(_onMessage);
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);

  final message = await fcm.getInitialMessage();
  if (message!=null){
    final data = message.data;
    debugPrint("INIT!! : $data");
  }
}

void _onMessage(RemoteMessage message){
  debugPrint("ONMSG!!: ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if(notification != null && android != null){
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.green,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("ONBG!! : ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message){
  final data = message.data;
  debugPrint("ONOPENED!!: $data");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_channel',
  'My Channel',
  importance: Importance.high,);