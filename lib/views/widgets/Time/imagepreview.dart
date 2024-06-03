import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({super.key, this.image});
  // ignore: prefer_typing_uninitialized_variables
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