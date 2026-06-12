
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  //color

//navigation
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}

class Navigation {
  static void goPush(context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  static void goPushReplace(context, Widget screen) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
}