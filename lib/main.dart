import 'package:drug_flow/core/app/app_cubit/app_cubit.dart';
import 'package:drug_flow/core/app/app_cubit/app_state.dart';
import 'package:drug_flow/core/app/bloc_observer.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:drug_flow/core/localization/app_localizations_setup.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';
import 'package:drug_flow/features/Auths/otp/ui/otp_screen.dart';
import 'package:drug_flow/features/Auths/forgot_password/ui/screens/forgot_password_confirmation.dart';
import 'package:drug_flow/features/Auths/forgot_password/ui/screens/new_password.dart';
import 'package:drug_flow/features/Auths/login/ui/login_screen.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/screens/bottom_bar_screen.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/cart_screen.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_details_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/coupons_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/faqs_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/injection_container/injection_container.dart' as di;
import 'core/constants/colors.dart';
import 'features/Home_sction/profile/presentation/screens/contact_us_screen.dart';
import 'go_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

final GlobalKey<ScaffoldMessengerState> msgKey = GlobalKey();
final GlobalKey<NavigatorState> navKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();
  await SharedPrefHelper().instantiatePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppCubit>()..getSavedLanguage(),
      // ✅ ScreenUtilInit must use `builder:` — the `child:` API skips init
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final cubit = context.read<AppCubit>();
              return ToastificationWrapper(
                child: MaterialApp.router(
                  routerConfig: router,
                  scaffoldMessengerKey: msgKey,
                  debugShowCheckedModeBanner: false,
                  locale: Locale(cubit.currentLangCode),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  theme: ThemeData(
                    // fontFamily: 'Cairo',
                    
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.transparent,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.light,
                        statusBarBrightness: Brightness.light,
                      ),
                    ),
                    bottomSheetTheme: const BottomSheetThemeData(
                      constraints: BoxConstraints(maxWidth: double.infinity),
                    ),
                    colorScheme: ColorScheme.fromSeed(seedColor: white),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//mohamed.sala71996@gmail.com
//123456789