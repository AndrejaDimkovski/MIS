import 'package:flutter/material.dart';
import 'package:jokeapp/providers/favoritejokeprovider.dart';
import 'package:provider/provider.dart';



class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<FavoriteJokeProvider>(context);
    final favoriteJokes = pokemonProvider.favoriteJokes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: favoriteJokes.isEmpty
          ? const Center(child: Text('No favorite jokes added.'))
          : ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          final joke = favoriteJokes[index];

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
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  pokemonProvider.removeFavorite(joke);  // Бришење од омилени
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
