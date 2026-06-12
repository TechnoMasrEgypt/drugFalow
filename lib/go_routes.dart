import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/features/Auths/otp/ui/otp_screen.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_cubit.dart';
import 'package:drug_flow/features/Auths/otp/logic/otp_cubit.dart';
import 'package:drug_flow/features/Auths/forgot_password/ui/screens/forgot_password_screen.dart';
import 'package:drug_flow/features/Auths/login/ui/login_screen.dart';
import 'package:drug_flow/features/Auths/register/logic/governorate/governorate_cubit.dart';
import 'package:drug_flow/features/Auths/register/logic/register_cubit.dart';
import 'package:drug_flow/features/Auths/register/ui/register_screen.dart';
import 'package:drug_flow/features/Auths/login/logic/login_cubit.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/cubit/bottom_bar_cubit.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/screens/bottom_bar_screen.dart';
import 'package:drug_flow/features/Auths/splash/presentation/cubit/splash_cubit.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/product_item.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_details_screen.dart';
import 'package:drug_flow/features/Home_sction/notifications/presentation/notification_screen.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/order_details_screen.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_details_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/coupons/coupons_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/faqs/faqs_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/contact_us_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/coupons_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/edit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/faqs_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/personal_info.dart';
import 'package:drug_flow/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/Auths/splash/presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: splash,
  routes: [
    GoRoute(
      path: splash,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => SplashCubit(),
          child: SplashScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: onboardingSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => sl<OnboardingCubit>(),
          child: OnBoardingScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: registerSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<RegisterCubit>()),
            BlocProvider(create: (context) => sl<GovernorateCubit>()),
          ],
          child: RegisterScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: editProfileSc,
      pageBuilder: (context, state) {
        final profileCubit = state.extra as ProfileCubit;
        return CustomTransitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: profileCubit),
              BlocProvider(create: (context) => sl<GovernorateCubit>()),
            ],
            child: const EditProfileScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
   GoRoute(
  path: personalInfoSc,
  pageBuilder: (context, state) {
    final profileCubit = state.extra as ProfileCubit;

    return CustomTransitionPage(
      key: state.pageKey,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: profileCubit),
          BlocProvider(create: (_) => sl<GovernorateCubit>()),
        ],
        child: const PersonalInfo(),
      ),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  },
),
    GoRoute(
      path: loginSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: LoginScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: forgoPassSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
          child: ForogotPasswordScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: otpSc,
      pageBuilder: (context, state) {
        final email = state.extra as String;
        return CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => sl<OtpCubit>(),
            child: OtpScreen(email: email),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: cuoponSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (_) => sl<CouponsCubit>()..getCoupons(),
    ),
  ],
  child: CouponsScreen(),
),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: faqsSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
  create: (_) => sl<FaqsCubit>()..getFaqs(),
  child: FaqsScreen(),
),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: contactUsSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ContactUsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: bottomBarSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BottomBarScreen(),
        //  BlocProvider(
        //   create: (context) => sl<BottomBarCubit>(),
        //   child: BottomBarScreen(),
        // ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: warehouseDetailsScreenSc,
      pageBuilder: (context, state) {
        final data = state.extra as WarehouseItem;

        return CustomTransitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<WarehouseCubit>()),
              BlocProvider(create: (context) => FilterCubit(sl())),
            ],
            child: WarehouseDetailsScreen(warehouseId: data.id!),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),

    GoRoute(
      path: orderDetailsSc,
      pageBuilder: (context, state) {
        final data = state.extra as OrderModel;

        return CustomTransitionPage(
          key: state.pageKey,
          child: OrderDetailScreen(order: data),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: ordersSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: OrdersScreen(),
        //  BlocProvider(
        //   create: (context) => sl<BottomBarCubit>(),
        //   child: BottomBarScreen(),
        // ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: productsListSc,

      pageBuilder: (context, state) {
        final data = state.extra as ProductModel;

        return CustomTransitionPage(
          key: state.pageKey,

          child: ProductDetailsScreen(product: data),
          //  BlocProvider(
          //   create: (context) => sl<BottomBarCubit>(),
          //   child: BottomBarScreen(),
          // ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: notificationsSc,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: NotificationScreen(),
        //  BlocProvider(
        //   create: (context) => sl<BottomBarCubit>(),
        //   child: BottomBarScreen(),
        // ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);

/*final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: splash,
  routes: [

    /// Splash
    GoRoute(
      path: splash,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<SplashCubit>(),
          child: SplashScreen(),
        ),
      ),
    ),

    /// Onboarding
    GoRoute(
      path: onboardingSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OnBoardingCubit>(),
          child: OnBoardingScreen(),
        ),
      ),
    ),

    /// Login
    GoRoute(
      path: login,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<LoginCubit>(),
          child: LoginScreen(),
        ),
      ),
    ),

    /// OTP (with params)
    GoRoute(
      path: otpSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<OtpCubit>()),
            BlocProvider(create: (_) => sl<ForgotPasswordCubit>()),
          ],
          child: OtpScreen(
            params: state.extra as OtpParams,
          ),
        ),
      ),
    ),

    /// Bottom Bar
    GoRoute(
      path: bottomBarSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<ProfileCubit>()),
            BlocProvider(create: (_) => sl<BottomBarCubit>()),
            BlocProvider(create: (_) => sl<CartCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
            BlocProvider(create: (_) => sl<NotificationsCubit>()),
          ],
          child: BottomBarScreen(),
        ),
      ),
    ),

    /// Product Details
    GoRoute(
      path: productSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<ProductCubit>(),
          child: ProductDetailsScreen(
            params: state.extra as ProductsParams,
          ),
        ),
      ),
    ),

    /// Orders
    GoRoute(
      path: ordersSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OrdersCubit>(),
          child: OrdersScreen(),
        ),
      ),
    ),

    /// Order Details
    GoRoute(
      path: orderDetailsSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OrderDetailsCubit>(),
          child: OrderDetailsScreen(
            params: state.extra as OrdersParams,
          ),
        ),
      ),
    ),

    /// Cart
    GoRoute(
      path: cartSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: state.extra as CartCubit,
            ),
            BlocProvider(create: (_) => sl<FavouritesCubit>()),
            BlocProvider(create: (_) => sl<ConfirmOrderCubit>()),
          ],
          child: CartScreen(),
        ),
      ),
    ),

    /// Wholesale (your example)
    GoRoute(
      path: wholesaleSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<BottomBarCubit>()),
            BlocProvider(create: (_) => sl<ShopsCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
          ],
          child: ShopsScreen(type: 'sub'),
        ),
      ),
    ),

  ],
);*/
