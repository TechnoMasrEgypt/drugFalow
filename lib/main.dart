import 'package:drug_flow/core/app/app_cubit/app_cubit.dart';
import 'package:drug_flow/core/app/app_cubit/app_state.dart';
import 'package:drug_flow/core/app/bloc_observer.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:drug_flow/core/localization/app_localizations_setup.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/injection_container/injection_container.dart' as di;
import 'core/constants/colors.dart';
import 'go_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
final GlobalKey<ScaffoldMessengerState> msgKey = GlobalKey();
final GlobalKey<NavigatorState> navKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
final stopwatch = Stopwatch()..start();

await di.init();

print('DI INIT => ${stopwatch.elapsedMilliseconds}');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();

  await SharedPrefHelper().instantiatePreferences();
  stopwatch.stop();
  print('TOTAL APP INIT => ${stopwatch.elapsedMilliseconds}');
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
