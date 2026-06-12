// import 'package:drug_flow/features/home/presentation/screens/home_screen.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/cart_screen.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/ui/main_screen.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_details_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection_container/injection_container.dart';

List<Widget> screens({BuildContext? context}) => [
  // HomeScreen(),
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => WarehouseCubit(sl())..getWarehouses()),
      BlocProvider(create: (context) => MedicineSearchCubit(sl())),
    ],
    child: MainScreen(),
  ),
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ProductsCubit(sl())..getProducts()),
      BlocProvider(create: (context) => FilterCubit(sl())),
      BlocProvider(create: (context) => MedicineSearchCubit(sl())),
    ],
    child: ProductsScreen(),
  ),
  CartScreen(),

  BlocProvider(
    create: (context) => ProfileCubit(sl())..getProfile(),
    child: ProfileScreen(),
  ),
];
