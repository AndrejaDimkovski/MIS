import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.green[700],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://www.shutterstock.com/image-vector/vector-image-cartoon-zoological-garden-260nw-178133171.jpg',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Welcome to Our Zoo!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Our zoo is home to a wide variety of animals, from exotic birds to majestic mammals. '
                    'Our mission is to provide a safe and nurturing environment for the animals while offering '
                    'a fun and educational experience for our visitors. We believe in wildlife conservation '
                    'and strive to promote environmental awareness through engaging exhibits and activities.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const Text(
                'What We Offer:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '- Educational tours and programs: Our expert guides offer in-depth knowledge about the '
                    'animals and their habitats.\n'
                    '- Animal encounters: Get up close and personal with some of our most beloved residents.\n'
                    '- Conservation efforts: We are committed to protecting endangered species and their environments.\n'
                    '- Fun family-friendly activities: Explore interactive exhibits, games, and shows for all ages.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const Text(
                'Behavior Codex:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'At our zoo, we ask that all visitors follow our behavior codex to ensure the safety of both '
                    'animals and guests:\n\n'
                    '- Be respectful of the animals: Never tap on the glass or try to provoke them.\n'
                    '- Follow all guidelines given by our staff to ensure the well-being of the animals.\n'
                    '- Keep a safe distance and avoid loud noises near the enclosures.\n'
                    '- Dispose of trash in designated bins to maintain the beauty of our zoo.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
