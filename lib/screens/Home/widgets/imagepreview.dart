import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({super.key, this.image});
  final image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
  child: Image.network(image),
      ),

    );
  }
}