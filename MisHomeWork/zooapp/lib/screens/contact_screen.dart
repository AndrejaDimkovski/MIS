import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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

              // Title
              const Text(
                'Get in Touch with Us!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Have any questions, suggestions, or feedback? We would love to hear from you! '
                    'Feel free to reach out to us through any of the following contact methods.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const Text(
                'Ways to Contact Us:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '- Call Us: +02 322 0578\n'
                    '- Email Us: zooskopje@zooskopje.com.mk\n'
                    '- Visit Us: Ilinden Boulevard, Skopje, Republic of Macedonia\n'
                    '- Social Media: @SkopjeZoo on Instagram, Facebook, and Twitter',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const Text(
                'Feedback Form:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We value your feedback to improve our zoo experience. Please let us know how we can serve you better!',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const Text(
                'Address Information:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Zoo Address: Ilinden Boulevard, Skopje, Republic of Macedonia\n'
                    'We look forward to seeing you soon at our zoo!',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
