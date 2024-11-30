import 'package:clothesapp/models/Item.dart';
import 'package:clothesapp/widgets/clothing_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ClothingItem> clothingItems = [
      ClothingItem(
          id: 1,
          name: "Marvel T-shirt",
          img: "https://www.redwolf.in/image/cache/catalog/mens-t-shirts/marvel-logo-t-shirt-600x800.jpg?m=1687874395",
          description: "Мајца со натпис Marvel",
          price: 15.0),
      ClothingItem(
          id: 2,
          name: "Adidas Sneakers",
          img: "https://assets.adidas.com/images/w_450,f_auto,q_auto/2345cc874f884fc0a6a8af50010537fb_9366/HQ8708_00_plp_standard.jpg",
          description: "Патики Adidas",
          price: 90.0),
      ClothingItem(
          id: 3,
          name: "Adidas running Sneakers",
          img: "https://assets.ajio.com/medias/sys_master/root/20230807/OatO/64d0b946a9b42d15c9912d15/-473Wx593H-469496263-black-MODEL.jpg",
          description: "Патики за трчање Adidas",
          price: 100.0),
      ClothingItem(
          id: 4,
          name: "Nike Air Max",
          img: "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/e7c867e1-598a-4544-b670-1f378de3754e/M+NIKE+AIR+MAX+ALPHA+TRAINER+5.png",
          description: "Патики Nike Air Max",
          price: 250.0),
      ClothingItem(
          id: 5,
          name: "Adidas Tracksuit",
          img: "https://www.tennis-point.co.uk/dw/image/v2/BBDP_PRD/on/demandware.static/-/Sites-master-catalog/default/dwab134bbf/images/005/462/18011000_000.jpg?q=80&sw=2000",
          description: "Тренерки Adidas",
          price: 90.0),
      ClothingItem(
          id: 6,
          name: "Nike Tracksuit",
          img: "https://www.sportsdirect.com/images/products/63836903_l.jpg",
          description: "Тренерки Nike",
          price: 110.0),
      ClothingItem(
          id: 7,
          name: "Trousers for men Black",
          img: "https://rukminim2.flixcart.com/image/850/1000/xif0q/trouser/e/s/z/30-tu1-vebnor-original-imagmy6hhhz62qzn.jpeg?q=90&crop=false",
          description: "Панталони",
          price: 45.0),
      ClothingItem(
          id: 8,
          name: "Trousers for Men LightBlue",
          img: "https://www.urbanofashion.com/cdn/shop/files/epnchino-8-blueshadow-1_3d643912-d640-4ec7-9477-28d30dd3a9db.jpg?v=1706686090",
          description: "Панталони",
          price: 49.0)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "195041",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Explore Our Collection",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClothingGrid(clothingItems: clothingItems),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
