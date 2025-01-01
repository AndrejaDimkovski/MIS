import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jokeapp/providers/favoritejokeprovider.dart';
import 'package:jokeapp/screens/favoritescreen.dart';
import 'package:jokeapp/screens/home.dart';
import 'package:jokeapp/screens/jokes_screen.dart';
import 'package:jokeapp/screens/random_joke_screen.dart';
import 'package:jokeapp/services/firebase_api.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteJokeProvider(),
      child: Builder(
        builder: (context) {
          FirebaseApi().initNotifications(context);
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
              '/favorites': (context) => const FavoritesScreen(),
              '/randomJoke': (context) => const RandomJokeScreen(),
            },
          );
        },
      ),
    );
  }
}
