import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/update_cart_item_request.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_state.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/order_card.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isDrafted = true;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getMyCart(isDrafted: true);
  }

  void _switchTab(bool value) {
    setState(() => isDrafted = value);
    context.read<CartCubit>().getMyCart(isDrafted: value);
  }

  Widget _buildCartList(List<CartDataModel> carts) {
    if (carts.isEmpty) {
      return const Center(child: Text('السلة فارغة 🛒'));
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        for (final cart in carts)
          OrderCard(
            isDrafted: isDrafted,
            cart: cart,
            isSaveForLater: isDrafted,
            onConfirm: () {
              // context.pop();
              context.push(ordersSc);
            },
            onDelete: () {
              context.read<CartCubit>().deleteWholeCart(
                id: cart.id,
                isDrafted: isDrafted,
              );
              // context.pop();
            },
            onSaveForLater: () {
              context.read<CartCubit>().saveCartAsDraft(id: cart.id);
              // context.pop();
              print('dadada');
            },

            onProductTap: () {},
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Text('سلة المشتريات', style: TextStyles.textStyleBold20),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Tab(
                      title: 'save for later',
                      icon: Icons.bookmark,
                      active: !isDrafted,
                      onTap: () => _switchTab(false),
                    ),
                    _Tab(
                      title: 'current request',
                      icon: Icons.wallet,
                      active: isDrafted,
                      onTap: () => _switchTab(true),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                // 🔵 LOADING (initial load only)
                if (state is CartLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // 🔴 ERROR
                if (state is CartError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message, textAlign: TextAlign.center),
                        SizedBox(height: 16.h),
                        TextButton(
                          onPressed: () {
                            context.read<CartCubit>().getMyCart(
                              isDrafted: isDrafted,
                            );
                          },
                          child: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                // 🟢 SUCCESS
                if (state is CartSuccess) {
                  final carts = state.response.data;
                  return _buildCartList(carts);
                }


                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tab widget (unchanged from original)
// ─────────────────────────────────────────────────────────────────────────────
class _Tab extends StatelessWidget {
  const _Tab({
    required this.title,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 160.w,
        height: 70.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: active ? AppColor.textPrimary : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: active ? Colors.white : AppColor.textPrimary),
            Text(
              title,
              style: TextStyles.textStyleNormal16.copyWith(
                color: active ? Colors.white : AppColor.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
