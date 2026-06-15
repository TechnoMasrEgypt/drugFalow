// import 'package:drug_flow/features/home/presentation/screens/home_screen.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/cart_screen.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/ui/main_screen.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_details_screen.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection_container/injection_container.dart';
// In your main app or wherever you call screens(), create cubits once:

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  // ← Create once, never recreated on tab switch
  late final CartCubit _cartCubit = CartCubit(sl());
  late final OrdersCubit _ordersCubit = OrdersCubit(sl());
  late final WarehouseCubit _warehouseCubit = WarehouseCubit(sl())..getWarehouses();
  late final ProductsCubit _productsCubit = ProductsCubit(sl())..getProducts();
  late final FilterCubit _filterCubit = FilterCubit(sl());
  late final MedicineSearchCubit _searchCubit = MedicineSearchCubit(sl());

  @override
  void dispose() {
    _cartCubit.close();
    _ordersCubit.close();
    _warehouseCubit.close();
    _productsCubit.close();
    _filterCubit.close();
    _searchCubit.close();
    super.dispose();
  }

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
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children:  [
            MainScreen(),
            ProductsScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [],
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          // your items...
        ),
      ),
    );
  }
}