import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {


  static Future<http.Response> getJokeTypes() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
    print("Joke Types Response: ${response.body}");
    return response;
  }


  static Future<http.Response> getJokesByType(String type) async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    print("Jokes for $type Response: ${response.body}");
    return response;
  }


  static Future<http.Response> getRandomJoke() async {
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    print("Random Joke Response: ${response.body}");
    return response;
  }
}
