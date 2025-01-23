import 'package:flutter/material.dart';

class ZooBackground extends StatelessWidget {
  final Widget child;

  const ZooBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://t4.ftcdn.net/jpg/07/13/94/21/360_F_713942138_mHDC01nAHt5HuZsTTgvItP01o8X2PyJL.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // Child widget
        child,
      ],
    );
  }
}
