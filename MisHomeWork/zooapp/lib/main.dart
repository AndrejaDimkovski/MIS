import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/residents_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/location_screen.dart';
import 'widgets/background.dart';

void main() {
  runApp(const ZooApp());
}

class ZooApp extends StatelessWidget {
  const ZooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ZooBackground(child: HomeScreen()),
        '/residents': (context) => const ZooBackground(child: ResidentsScreen()),
        '/about': (context) => ZooBackground(child: AboutUsScreen()),
        '/contact': (context) => ZooBackground(child: ContactScreen()),
        '/location': (context) => ZooBackground(child: LocationScreen()),
      },
    );
  }
}
