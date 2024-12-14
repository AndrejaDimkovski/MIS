import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/jokes_screen.dart';
import './screens/random_joke_screen.dart';

void main() {
  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) => const JokesScreen(),
        '/randomJoke': (context) => const RandomJokeScreen(),
      },
    );
  }
}
