import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  bool get _isSvg => image.toLowerCase().endsWith('.svg');

  bool get _isNetwork =>
      image.startsWith('http://') ||
      image.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (_isNetwork) {
      child = _isSvg
          ? SvgPicture.network(
              image,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (_) =>
                  const Center(
                child:
                    CircularProgressIndicator(),
              ),
            )
          : Image.network(
              image,
              width: width,
              height: height,
              fit: fit,
              errorBuilder:
                  (_, __, ___) =>
                      const Icon(Icons.error),
            );
    } else {
      child = _isSvg
          ? SvgPicture.asset(
              image,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.asset(
              image,
              width: width,
              height: height,
              fit: fit,
            );
    }

    return borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius!,
            child: child,
          )
        : child;
  }
}