import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications(BuildContext context) async {

    await _firebaseMessaging.requestPermission();


    final fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(message.notification!.title ?? 'Notification'),
            content: Text(message.notification!.body ?? 'No content'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/randomJoke');
                },
                child: const Text('View'),
              ),
            ],
          ),
        );
      }
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['route'] != null) {
        Navigator.of(context).pushNamed(message.data['route']);
      }
    });
  }
}
