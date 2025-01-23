import 'package:flutter/material.dart';
import 'category_screen.dart';

class ResidentsScreen extends StatelessWidget {
  const ResidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Mammals',
        'image':
        'https://zooskopje.com.mk/wp-content/uploads/2023/05/PlaceholderImage-1.png.webp'
      },
      {
        'name': 'Birds',
        'image':
        'https://zooskopje.com.mk/wp-content/uploads/2023/05/PlaceholderImage-2.png.webp'
      },
      {
        'name': 'Reptiles',
        'image':
        'https://zooskopje.com.mk/wp-content/uploads/2023/05/PlaceholderImage-3.png.webp'
      },
      {
        'name': 'Insects',
        'image':
        'https://zooskopje.com.mk/wp-content/uploads/2023/05/PlaceholderImage-4.png.webp'
      },
      {
        'name': 'Fishes',
        'image':
        'https://zooskopje.com.mk/wp-content/uploads/2023/05/ribi-min.png.webp'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Residents of our Zoo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[800]!,
              Colors.green[500]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 3 / 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      categoryName: category['name'] as String,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      category['image'] as String,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Text(
                        category['name'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}