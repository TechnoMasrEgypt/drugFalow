import 'package:cached_network_image/cached_network_image.dart';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/update_cart_item_request.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.isdrafted,
  });

  final CartItemModel item;
  final VoidCallback onTap;
  final bool isdrafted;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
 void _changeQuantity(int delta) {
  final next = widget.item.quantity + delta;

  if (next < 1) return;

  context.read<CartCubit>().updateCartItem(
    isDrafted: widget.isdrafted,
    id: widget.item.id,
    body: UpdateCartItemRequest(
      quantity: next,
      product_id: widget.item.productId,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final product = widget.item.product;

    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product image ──────────────────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: product?.image ?? "",
              width: 80.w,
              height: 80.h,
              fit: BoxFit.fill,
              placeholder: (_, __) => Container(
                color: Colors.grey.shade100,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                color: Colors.grey.shade100,
                child: Icon(Icons.medication, size: 36.r, color: Colors.grey),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          // ── Details ────────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  product?.name ?? "",
                  style: TextStyles.textStyleBold13,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4.h),

                // Active ingredients chips
                if (product.activeIngredients.isNotEmpty)
                  Wrap(
                    spacing: 4.w,
                    runSpacing: 2.h,
                    children: product.activeIngredients
                        .map(
                          (ing) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: colorF7F7F8,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              ing.name,
                              style: TextStyles.textStyleNormal10.copyWith(
                                color: AppColor.partitionNameItemcolor,
                              ),
                              textScaler: TextScaler.linear(1),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                SizedBox(height: 6.h),

                // Prices row
                Row(
                  children: [
                    // Current price
                    Text(
                      '${product.price}ج.م',
                      style: TextStyles.textStyleBold13.copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),

                    SizedBox(width: 8.w),

                    // Original price (strikethrough)
                    Text(
                      '${product.priceBeforeDiscount} ج.م',
                      style: TextStyles.textStyleNormal11.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Spacer(),

                    // Discount badge
                    Container(
                      width: 70.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorFEF0F4,
                        border: Border.all(color: colorFBB1C4),
                      ),
                      child: Center(
                        child: Text(
                          '${product.discountPercentage.toStringAsFixed(0)}%',
                          style: TextStyles.textStyleNormal11.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),
                Row(
                  children: [
                    _StepperButton(
                      icon: Icons.remove,
                      onTap: () => _changeQuantity(-1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        '${widget.item.quantity}',
                        style: TextStyles.textStyleBold13,
                      ),
                    ),
                    _StepperButton(
                      icon: Icons.add,
                      onTap: () => _changeQuantity(1),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().deleteCartItem(
                          id: widget.item.id,
                          isDrafted: widget.isdrafted,
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    // const Spacer(),

                    // Total price (reactive to local quantity)
                    Text(
                      '${widget.item.totalPrice} ج.م',
                      style: TextStyles.textStyleBold12,
                    ),
                  ],
                ),

                // Quantity & total price
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//──────────────────────────────────────────────────────────────────────────
class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColor.textPrimary,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(icon, color: Colors.white, size: 16.r),
      ),
    );
  }
}
