import 'package:flutter/material.dart';

class FavoriteJokeProvider with ChangeNotifier {
  List<Map<String, dynamic>> _favoriteJokes = [];

  List<Map<String, dynamic>> get favoriteJokes => _favoriteJokes;

  void addFavorite(Map<String, dynamic> joke) {
    if (!_favoriteJokes.contains(joke)) {
      _favoriteJokes.add(joke);
      notifyListeners(); // Објавуваме промена
    } else {
      // Шегата веќе е додадена
      print('This joke is already in favorites!');
    }
  }

  void removeFavorite(Map<String, dynamic> joke) {
    _favoriteJokes.remove(joke);
    notifyListeners(); // Објавуваме промена
  }

  bool isFavorite(Map<String, dynamic> joke) {
    return _favoriteJokes.contains(joke);
  }
}
