import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jokeapp/providers/favoritejokeprovider.dart';
import 'package:provider/provider.dart';

import '../services/api_service.dart';


class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  List jokes = [];
  String type = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    type = ModalRoute.of(context)!.settings.arguments as String;
    fetchJokes();
  }

  void fetchJokes() async {
    ApiService.getJokesByType(type).then((response) {
      setState(() {
        jokes = json.decode(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<FavoriteJokeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(type.toUpperCase()),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/favorites',
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            final joke = jokes[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Icons.sentiment_satisfied_alt, color: Colors.orange, size: 30),
                title: Text(
                  joke['setup'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  joke['punchline'],
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                trailing: IconButton(
                  icon: Icon(
                    pokemonProvider.isFavorite(joke)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    if (pokemonProvider.isFavorite(joke)) {
                      pokemonProvider.removeFavorite(joke);  // Бришење од омилени
                    } else {
                      pokemonProvider.addFavorite(joke);  // Додавање во омилени
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
