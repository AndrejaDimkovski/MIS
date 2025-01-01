import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/joke_type.dart';
import '../services/api_service.dart';
import '../widgets/joke_type_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<JokeType> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    fetchJokeTypesFromAPI();
  }

  void fetchJokeTypesFromAPI() async {
    ApiService.getJokeTypes().then((response) {
      var data = List<String>.from(json.decode(response.body));
      setState(() {
        jokeTypes = data.map((type) => JokeType(name: type)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Column(
          children: [
            Text(
              "Joke Types",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "195041",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/randomJoke');
            },
            icon: const Icon(Icons.shuffle, color: Colors.white, size: 24),
          )
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: JokeTypeGrid(jokeTypes: jokeTypes.map((jokeType) => jokeType.name).toList()),
      ),
    );
  }
}
