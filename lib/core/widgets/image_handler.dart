import 'package:flutter/cupertino.dart';

class ImageHandler extends StatelessWidget {
  final String img;
  final double width;
  final double height;
  BoxFit? fit;

  ImageHandler({
    super.key,
    required this.img,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img,
      width: width,
      height: height,
      fit: fit,
      alignment: Alignment.center,
    );
  }
}

class ImageHandler2 extends StatelessWidget {
  final String img;
  final double width;
  final double height;
  BoxFit? fit;

  ImageHandler2({
    super.key,
    required this.img,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      img,
      width: width,
      height: height,
      fit: fit,
      alignment: Alignment.center,
    );
  }
}
