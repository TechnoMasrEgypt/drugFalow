import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/widgets/home_app_bar.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/ui/main_screen.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_screen.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/cart_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../widgets/nav_bar_items.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late final PersistentTabController _controller;
  late final CartCubit _cartCubit;
  late final OrdersCubit _ordersCubit;
  late final WarehouseCubit _warehouseCubit;
  late final ProductsCubit _productsCubit;
  late final FilterCubit _filterCubit;
  late final MedicineSearchCubit _searchCubit;
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _cartCubit = sl<CartCubit>()..getMyCart(isDrafted: true);
    _ordersCubit = sl<OrdersCubit>();
    _warehouseCubit = sl<WarehouseCubit>()..getWarehouses();
    _productsCubit = sl<ProductsCubit>()..getProducts();
    _filterCubit = sl<FilterCubit>();
    _searchCubit = sl<MedicineSearchCubit>();
    _profileCubit = sl<ProfileCubit>()..getProfile();
  }

  @override
  void dispose() {
    _cartCubit.close();
    _ordersCubit.close();
    _warehouseCubit.close();
    _productsCubit.close();
    _filterCubit.close();
    _searchCubit.close();
    _profileCubit.close();
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _screens() => [
    MainScreen(),
    ProductsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _cartCubit),
        BlocProvider.value(value: _ordersCubit),
        BlocProvider.value(value: _warehouseCubit),
        BlocProvider.value(value: _productsCubit),
        BlocProvider.value(value: _filterCubit),
        BlocProvider.value(value: _searchCubit),
        BlocProvider.value(value: _profileCubit),
      ],
      child: Scaffold(
        backgroundColor: white,
        appBar: homeAppBar(context: context, controller: _controller),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _screens(),
          items: navBarsItems(context: context),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: false,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
          onWillPop: (context) async {
            if (_controller.index != 0) {
              _controller.jumpToTab(0);
              return false;
            }
            return true;
          },
          backgroundColor: white,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 250),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.slide,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: context.height / 9.5,
          navBarStyle: NavBarStyle.style10,
        ),
      ),
    );
  }
}
