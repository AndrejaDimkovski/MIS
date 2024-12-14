import 'package:flutter/material.dart';
import '../widgets/joke_type_card.dart';

class JokeTypeGrid extends StatelessWidget {
  final List<String> jokeTypes;
  const JokeTypeGrid({super.key, required this.jokeTypes});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 3 / 2,
      children: jokeTypes
          .map(
            (type) => JokeTypeCard(type: type),
      )
          .toList(),
    );
  }
}
