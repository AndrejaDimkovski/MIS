class JokeType {
  final String name;

  JokeType({required this.name});

  factory JokeType.fromJson(String name) {
    return JokeType(name: name);
  }
}
