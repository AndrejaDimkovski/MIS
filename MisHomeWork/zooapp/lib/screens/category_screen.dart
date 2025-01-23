import 'package:flutter/material.dart';
import '../models/animal_category.dart';
import '../models/animals.dart';
import 'animal_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final category = _getCategoryByName(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: const TextStyle(
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
            mainAxisSpacing: 25.0,
            childAspectRatio: 1 / 1,
          ),
          itemCount: category.animals.length,
          itemBuilder: (context, index) {
            final animal = category.animals[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalScreen(
                      animal: animal,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      animal.image,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            animal.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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

  AnimalCategory _getCategoryByName(String categoryName) {
    List<AnimalCategory> categories = [
      AnimalCategory(
        name: 'Mammals',
        animals: [
          Animal(
            name: 'Lion',
            info: 'The lion is a species of big cat.',
            image: 'https://imgs.search.brave.com/n5zgbJV-fv_GsMk8_hxZ8tLLbh-NhOh0B3Pehn1Qf8Q/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTUx/MzUwNzM4L3Bob3Rv/L2xpb24uanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPTY2YTdP/NU1SMy1RWjN0ay00/QUtWTmdSb1kzNGpT/ZHV5b0dCWmZGY2V1/YnM9',
            order: 'Carnivora',
            width: 1.2,
            weight: 190.0,
            spread: 'Africa, India',
            habitat: 'Grasslands, savannas, open woodlands',
          ),
          Animal(
            name: 'Elephant',
            info: 'Elephants are the largest land animals.',
            image: 'https://imgs.search.brave.com/ggqRBY6U6mfB1VqBTIWwVnmnTOwxOKXMipunhoLIOGk/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9h/ZnJpY2FuLWVsZXBo/YW50XzExNjAtODM2/LmpwZz9zZW10PWFp/c19oeWJyaWQ',
            order: 'Proboscidea',
            width: 2.7,
            weight: 6000.0,
            spread: 'Africa, Asia',
            habitat: 'Savannahs, forests, grasslands',
          ),
          Animal(
            name: 'Tiger',
            info: 'Tigers are large cats known for their stripes.',
            image: 'https://imgs.search.brave.com/3cZqtpdzVdquH8ZchWEDc6IA7GySqmcf5J2wu8IY5wM/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE3/ODY4MTkxNi9waG90/by9zdW1hdHJlYW4t/dGlnZXIuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPVJfN1JH/WmFsR2Y3Sk9UU2M4/eHU5VjZVRThYanJQ/dFdnWkZlT3VfQUtZ/WkE9',
            order: 'Carnivora',
            width: 1.0,
            weight: 220.0,
            spread: 'Asia',
            habitat: 'Tropical forests, grasslands',
          ),
          Animal(
            name: 'Bear',
            info: 'Bears are large mammals that live in forests.',
            image: 'https://imgs.search.brave.com/cl-VdgHxp0sXadISsCH1PKMaVboQTN0RGxZeHI9wywg/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTAw/NTM0NTYwNC9waG90/by9ncml6emx5LWJl/YXIuanBnP3M9NjEy/eDYxMiZ3PTAmaz0y/MCZjPTZuV19Eenlo/aTNSWHRmT1FDS0Qz/aUJaOFE3d0drNF9u/cXdWd09JM3MyYzA9',
            order: 'Carnivora',
            width: 1.5,
            weight: 400.0,
            spread: 'North America, Europe, Asia',
            habitat: 'Forests, tundra, wetlands',
          ),
          Animal(
            name: 'Giraffe',
            info: 'Giraffes are the tallest land animals, known for their long necks.',
            image: 'https://imgs.search.brave.com/O_SD3TN83XWgH2xSKyqJmwq2_gDOQkQ3eEsJ84yjH3g/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE3/Mjg5NTQwL3Bob3Rv/L2dpcmFmZmUtcG9y/dHJhaXQtY2xvc2V1/cC5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9NGFBdHNPWks5/N1l6ZmF3V1J6ampI/U1pmNGFoM0xtX1BW/cWRneEp4MklHWT0',
            order: 'Artiodactyla',
            width: 1.8,
            weight: 800.0,
            spread: 'Sub-Saharan Africa',
            habitat: 'Savannahs, woodlands',
          ),
        ],
      ),
      AnimalCategory(
        name: 'Birds',
        animals: [
          Animal(
            name: 'Parrot',
            info: 'Parrots are colorful and intelligent birds.',
            image: 'https://imgs.search.brave.com/tLfhlkSQjlEPBNGC0Mk_7GfuXF4VI3FkCyKR47EsbR0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTk0/NDEzMjk4L3Bob3Rv/L2NheW1hbi1icmFj/LXBhcnJvdC5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9T01B/Z1RVS0h5OWIwV19u/ckVzSzMyLS1PZVNB/eHBsVmFUNGduR25p/YjVpTT0',
            order: 'Psittaciformes',
            width: 0.4,
            weight: 0.5,
            spread: 'Tropical and subtropical regions worldwide',
            habitat: 'Tropical and subtropical forests',
          ),
          Animal(
            name: 'Eagle',
            info: 'Eagles are powerful birds of prey.',
            image: 'https://imgs.search.brave.com/6T3Q8pU01kl5uGo8XSIzW57xYshZ3eX0WtsGP-BltSU/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTY4/NDg4NzI5L3Bob3Rv/L3Nvb24tZWFnbGUu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVdlbEFvZGYyektJ/TG9BOWdNbnRGYkxE/VDJMZmRDbzR1RFVt/VGZEMi0yRDg9',
            order: 'Accipitriformes',
            width: 2.3,
            weight: 6.0,
            spread: 'North America, Europe, Asia, Africa',
            habitat: 'Mountains, forests, coastal habitats',
          ),
          Animal(
            name: 'Sparrow',
            info: 'Sparrows are small, brownish-gray birds.',
            image: 'https://imgs.search.brave.com/TjuuEfGLDm2kVQJ6ovKgP-JvGNYNZC2Gpkj8nI6_xts/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE0/Mzg2Njk0L3Bob3Rv/L3RyZWUtc3BhcnJv/dy5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9amVqWmJINEpW/SFlDN3F2M2wtUDhT/Rm9NTTIxQkNRUWdY/aXhpdHRqS3Racz0',
            order: 'Passeriformes',
            width: 0.2,
            weight: 0.03,
            spread: 'Worldwide',
            habitat: 'Urban areas, gardens, fields',
          ),
          Animal(
            name: 'Peacock',
            info: 'Peacocks are known for their colorful and impressive tail feathers.',
            image: 'https://imgs.search.brave.com/kv1gPVlZKDOUExCKcUE-o4pu3ileB-6dRx1C66m7nSQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTgw/Njk5MzU4L3Bob3Rv/L3BlYWNvY2suanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPTEw/aGRaSzNfcUNFV3A0/LWNQbTRjWEZCVlht/Mkd4T1MxblhZWkI4/a21ZQlE9',
            order: 'Galliformes',
            width: 1.2,
            weight: 4.0,
            spread: 'Indian subcontinent, Southeast Asia',
            habitat: 'Open forests, grasslands, gardens',
          ),
          Animal(
            name: 'Penguin',
            info: 'Penguins are flightless birds that live in cold climates.',
            image: 'https://imgs.search.brave.com/pW6iHjIPGAbmZeujopGLDe-XUlJuG_KEmpVUQ4PNg1E/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/aW5kaWFuYXBvbGlz/em9vLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyNC8wNC9Q/ZW5ndWluLVJvY2to/b3BwZXItQ1UtQ2Ft/aWxsZS1NaWxsZXIt/NzY4eDg4NS53ZWJw',
            order: 'Sphenisciformes',
            width: 0.5,
            weight: 30.0,
            spread: 'Antarctica, sub-Antarctic regions',
            habitat: 'Cold coastal regions',
          ),
        ],
      ),
      AnimalCategory(
        name: 'Reptiles',
        animals: [
          Animal(
            name: 'Snake',
            info: 'Snakes are legless reptiles, known for their elongated bodies.',
            image: 'https://www.worldanimalprotection.org.nz/cdn-cgi/image/width=1280,format=auto/siteassets/article/marius-masalar-ln_gdbqtzvk-unsplash.jpg',
            order: 'Squamata',
            width: 0.3,
            weight: 1.0,
            spread: 'Worldwide',
            habitat: 'Forests, grasslands, deserts',
          ),
          Animal(
            name: 'Lizard',
            info: 'Lizards are reptiles with scaly skin and four legs.',
            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA0akWaQivGEaXGmScR_qgJ3fwVdovTA4b2FNgqj87dxIIDiNBvsdVjalXYyKgYfZFPVA&usqp=CAU',
            order: 'Squamata',
            width: 0.2,
            weight: 0.5,
            spread: 'Worldwide',
            habitat: 'Deserts, forests, rocky areas',
          ),
          Animal(
            name: 'Crocodile',
            info: 'Crocodiles are large reptiles found in rivers and swamps.',
            image: 'https://cdn.viva.org.uk/wp-content/uploads/2020/08/Crocodile-Pic.jpg',
            order: 'Crocodylia',
            width: 5.0,
            weight: 1000.0,
            spread: 'Africa, Australia, Southeast Asia',
            habitat: 'Rivers, lakes, swamps',
          ),
          Animal(
            name: 'Turtle',
            info: 'Turtles are reptiles with a hard, protective shell.',
            image: 'https://thumbs.dreamstime.com/b/land-wild-turtle-green-grass-summer-field-generated-ai-309969657.jpg',
            order: 'Testudines',
            width: 0.4,
            weight: 25.0,
            spread: 'Worldwide',
            habitat: 'Rivers, oceans, forests',
          ),
          Animal(
            name: 'Gecko',
            info: 'Geckos are small reptiles known for their sticky feet.',
            image: 'https://as1.ftcdn.net/v2/jpg/08/29/64/22/1000_F_829642233_UdkD4i2mGHO1RFgaj0gLh26YcTqdABQP.jpg',
            order: 'Squamata',
            width: 0.1,
            weight: 0.03,
            spread: 'Tropical and subtropical regions',
            habitat: 'Walls, trees, deserts',
          ),
        ],
      ),
      AnimalCategory(
        name: 'Insects',
        animals: [
          Animal(
            name: 'Butterfly',
            info: 'Butterflies are insects known for their colorful wings.',
            image: 'https://butterfly-conservation.org/sites/default/files/styles/large/public/2019-02/6935162911-monarch-butterfly-danaus-plexippus-male.jpg?itok=aa0VNaZ_',
            order: 'Lepidoptera',
            width: 0.1,
            weight: 0.005,
            spread: 'Worldwide',
            habitat: 'Fields, gardens, forests',
          ),
          Animal(
            name: 'Ant',
            info: 'Ants are small insects that live in colonies.',
            image: 'https://www.excelpestservices.com/wp-content/uploads/2024/05/ants.jpg',
            order: 'Hymenoptera',
            width: 0.01,
            weight: 0.0001,
            spread: 'Worldwide',
            habitat: 'Underground colonies, forests, buildings',
          ),
          Animal(
            name: 'Beetle',
            info: 'Beetles are insects with a hard outer shell.',
            image: 'https://www.cardinallawns.com/wp-content/uploads/2017/12/Japanese-Beetle.jpg',
            order: 'Coleoptera',
            width: 0.03,
            weight: 0.01,
            spread: 'Worldwide',
            habitat: 'Forests, gardens, underground',
          ),
          Animal(
            name: 'Dragonfly',
            info: 'Dragonflies are insects known for their long, narrow wings.',
            image: 'https://pensthorpe.com/wp-content/uploads/2023/01/Dragonfly-scaled.jpg',
            order: 'Odonata',
            width: 0.1,
            weight: 0.02,
            spread: 'Worldwide',
            habitat: 'Water bodies, wetlands',
          ),
          Animal(
            name: 'Bee',
            info: 'Bees are insects that pollinate flowers and produce honey.',
            image: 'https://static.wixstatic.com/media/6c16cb_58393dcde62248ccbf241d6437287f54~mv2.jpg/v1/crop/x_0,y_38,w_1600,h_1123/fill/w_584,h_418,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/WJPEG-Honey-bee-Hoss-NY-No-file-Green-Background_DSC4354.jpg',
            order: 'Hymenoptera',
            width: 0.05,
            weight: 0.005,
            spread: 'Worldwide',
            habitat: 'Flowering plants, hives',
          ),
        ],
      ),
      AnimalCategory(
        name: 'Fishes',
        animals: [
          Animal(
            name: 'Betta Fish',
            info: 'Betta fish, also known as Siamese fighting fish, are known for their vibrant colors and long, flowing fins.',
            image: 'https://tropicflow.com/cdn/shop/articles/image6_1100x.jpg?v=1716517884',
            order: 'Perciformes',
            width: 0.1,
            weight: 0.02,
            spread: 'Southeast Asia',
            habitat: 'Freshwater, shallow waters',
          ),
          Animal(
            name: 'Angelfish',
            info: 'Angelfish are popular aquarium fish, recognized for their graceful, triangular shape and beautiful, flowing fins.',
            image: 'https://www.completekoi.com/cdn/shop/articles/shutterstock_223898560_780x.jpg?v=1640008080',
            order: 'Cichliformes',
            width: 0.15,
            weight: 0.03,
            spread: 'South America',
            habitat: 'Freshwater, rivers and lakes',
          ),
          Animal(
            name: 'Neon Tetra',
            info: 'Neon Tetras are small, brightly colored fish that are popular in freshwater aquariums.',
            image: 'https://obsidianaquatics.com.au/cdn/shop/products/neon-tetra-165374.jpg?v=1688224402',
            order: 'Characiformes',
            width: 0.03,
            weight: 0.001,
            spread: 'South America',
            habitat: 'Freshwater, slow-moving rivers',
          ),
          Animal(
            name: 'Guppy',
            info: 'Guppies are small, colorful fish often found in home aquariums and known for their live-bearing reproductive habits.',
            image: 'https://coburgaquarium.com.au/cdn/shop/products/Guppy_01_9ef74059-3ebb-4a32-b08d-519d319812a9_800x.jpg?v=1577060121',
            order: 'Cyprinodontiformes',
            width: 0.05,
            weight: 0.002,
            spread: 'South America, Caribbean',
            habitat: 'Freshwater, streams and rivers',
          ),
          Animal(
            name: 'Discus Fish',
            info: 'Discus fish are known for their flat, round shape and vibrant colors, often seen in aquarium displays.',
            image: 'https://cdn-chfbj.nitrocdn.com/DbsqJXXICEBTNBfzOstbPgZnWXGGquVW/assets/images/optimized/rev-8fe26c3/aquadecorbackgrounds.com/wp-content/uploads/2019/06/discus-fish.jpg',
            order: 'Cichliformes',
            width: 0.2,
            weight: 0.05,
            spread: 'South America',
            habitat: 'Freshwater, rivers',
          ),
        ],
      ),
    ];

    return categories.firstWhere((category) => category.name == categoryName);
  }
}