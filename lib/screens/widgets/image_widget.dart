import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
    final String imagePath;
   final double width;
   final double height;
   final BoxFit fit;

  const ImageWidget({
    super.key,
    required this.imagePath,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}