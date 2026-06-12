import 'dart:math';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart'; 


List<Widget> buildAroundWidgets(BuildContext context) {
  final radius = context.width / 5 / 2 + 12;

  final widgets = [
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: context.width / 15,
        height: context.width / 15,
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: context.width / 18,
      height: context.width / 18,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: context.width / 15,
        height: context.width / 15,
        fit: BoxFit.cover,
      ),
    ),

    Container(
      width: context.width / 18,
      height: context.width / 18,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: context.width / 15,
        height: context.width / 15,
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: context.width / 18,
      height: context.width / 18,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: context.width / 15,
        height: context.width / 15,
        fit: BoxFit.cover,
      ),
    ),

    // Add more different widgets here...
  ];

  return List.generate(widgets.length, (index) {
    final angle = (index * 2 * pi) / widgets.length;

    return Positioned(
      left: radius * cos(angle),
      top: radius * sin(angle),
      child: widgets[index],
    );
  });
}