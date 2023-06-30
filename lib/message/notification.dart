import 'package:final_project/message/time.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:final_project/message/time.dart';

class notification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future showNotification() async {
    final id = '0';

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      id,
      'take your drug',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher',

    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   1,
    //   'remmber',
    //   'take your drug',
    //   tz.TZDateTime.from( , tz.local),
    //     //(int 5).add(Duration(seconds: 1)),
    //   platformChannelSpecifics,
    //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    //   androidAllowWhileIdle:
    //   true, // To show notification even when the app is closed
    // );


    /// periodically...but const id && const title,body
    /*await flutterLocalNotificationsPlugin.periodicallyShow(
    Random().nextInt(azkar.length-1),
    'السلام عليكم',
    azkar[Random().nextInt(azkar.length-1)],
    RepeatInterval.everyMinute,
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: '',
  );*/

  }


  void callbackDispatcher() {
    // initial notifications
    var initializationSettingsAndroid = AndroidInitializationSettings(
        '@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    WidgetsFlutterBinding.ensureInitialized();

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );


    Workmanager().executeTask((task, inputData) {
      showNotification();
      return Future.value(true);
    });
  }


}
