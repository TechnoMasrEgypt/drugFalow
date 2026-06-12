import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height / 60),
      padding: EdgeInsets.all(context.width / 35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color111111.withOpacity(.1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name ?? ""),

                SizedBox(height: 8.h),

                Text(product.category ?? ""),

                SizedBox(height: 8.h),

                Wrap(
                  spacing: 8.r,
                  children:
                      product.activeIngredients
                          ?.map((e) => Chip(label: Text(e.name ?? "")))
                          .toList() ??
                      [],
                ),

                SizedBox(height: 8.h),

                Text("${product.price} ج.م"),
              ],
            ),
          ),

          SizedBox(width: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppImage(image: product.image ?? "", width: 90, height: 90),
          ),
        ],
      ),
    );
  }
}
