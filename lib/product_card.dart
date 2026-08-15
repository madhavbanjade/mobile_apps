import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String text;
  final double price;
  final String image;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.text,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
         color: backgroundColor,
         borderRadius: BorderRadius.circular(20)
      ),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Text('\$ $price', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 5),
          Center(child: Image.asset(image, height: 175)),
        ],
      ),
    );
  }
}
