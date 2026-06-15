import 'package:drug_flow/core/localization/app_localizations.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_statuses_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
double get width => MediaQuery.of(this).size.width;
double get height => MediaQuery.of(this).size.height;
}

extension NavigatorHelper on BuildContext {
String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
  void pushNamed({String? name, Object? args}){
    Navigator.of(this).pushNamed(name!,arguments: args);
  }
  void pushReplacementNamed({String? name, Object? args}){
    Navigator.of(this).pushReplacementNamed(name!,arguments: args);
  }
  void pushNamedAndRemoveUntil({String? name, Object? args}){
    Navigator.of(this).pushNamedAndRemoveUntil(name!
        ,(Route<dynamic> route) => false,arguments: args);
  }
  void pop(){
    Navigator.of(this).pop();
  }
}

class OrderStatusHelper {
  static String getLabel(
    String status,
    List<OrderStatusModel> statuses,
  ) {
    try {
      return statuses
          .firstWhere((e) => e.value == status)
          .label;
    } catch (_) {
      return status;
    }
  }

  static Color getColor(String status) {
    switch (status) {
      case 'completed':
        return const Color(0xFF34C759);

      case 'cancelled':
        return const Color(0xFFFF3B6B);

      case 'processing':
        return const Color(0xFFFFB830);

      case 'pending':
        return const Color(0xFF5AABFF);

      default:
        return Colors.grey;
    }
  }

  static Color getBackgroundColor(String status) {
    switch (status) {
      case 'completed':
        return const Color(0xFFE6F9F0);

      case 'cancelled':
        return const Color(0xFFFFF0F3);

      case 'processing':
        return const Color(0xFFFFF8ED);

      case 'pending':
        return const Color(0xFFEDF6FF);

      default:
        return Colors.grey.shade100;
    }
  }
}