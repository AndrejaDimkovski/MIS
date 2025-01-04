import 'package:flutter/material.dart';
import 'screens/calendar_screen.dart';
import 'services/nofitication_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}
