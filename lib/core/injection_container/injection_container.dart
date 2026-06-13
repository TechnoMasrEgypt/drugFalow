import 'package:drug_flow/core/app/app_cubit/app_cubit.dart';
import 'package:drug_flow/core/local/auth_local_data_source.dart';
import 'package:drug_flow/core/networking/api_services.dart';
import 'package:drug_flow/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:drug_flow/features/Auths/auth/domain/repositories/auth_repositories.dart';
import 'package:drug_flow/features/Auths/auth/domain/usecases/register_use_case.dart';
import 'package:drug_flow/features/Auths/forgot_password/data/forget_password_repo.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_cubit.dart';
import 'package:drug_flow/features/Auths/login/data/repo/login_repo.dart';
import 'package:drug_flow/features/Auths/login/logic/login_cubit.dart';
import 'package:drug_flow/features/Auths/onboarding/on_boarding_inj.dart';
import 'package:drug_flow/features/Auths/register/data/repo/governorate_repo.dart';
import 'package:drug_flow/features/Auths/register/data/repo/register_repo.dart';
import 'package:drug_flow/features/Auths/register/logic/governorate/governorate_cubit.dart';
import 'package:drug_flow/features/Auths/otp/data/repo/otp_repo.dart';
import 'package:drug_flow/features/Auths/otp/logic/otp_cubit.dart';
import 'package:drug_flow/features/Auths/register/logic/register_cubit.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/bottom_bar_inj.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_repos.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/data/repos/warehouse_repos.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/home_inj.dart';
import 'package:drug_flow/features/Home_sction/notifications/notifications_inj.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/repositories/orders_repositories.dart';
import 'package:drug_flow/features/Home_sction/orders/orders_inj.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/products_inj.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logic/profile_repo.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/coupons/coupons_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/faqs/faqs_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
// import 'package:drug_flow/features/profile/profile_inj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  Dio dio = DioFactory.getDio();

  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepository(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<RegisterRepo>(() => RegisterRepo(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerLazySingleton<GovernorateRepo>(() => GovernorateRepo(sl()));
  sl.registerFactory<GovernorateCubit>(() => GovernorateCubit(sl()));
  sl.registerLazySingleton<OtpRepo>(() => OtpRepo(sl()));
  sl.registerFactory<OtpCubit>(() => OtpCubit(sl()));
  sl.registerLazySingleton<ForgetRepo>(() => ForgetRepo(sl()));
  sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton<WarehouseRepository>(
    () => WarehouseRepository(sl()),
  );
  sl.registerFactory<FaqsCubit>(() => FaqsCubit(sl()));
  sl.registerFactory<CouponsCubit>(() => CouponsCubit(sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
  sl.registerFactory<ProfileRepo>(() => ProfileRepo(sl()));
  sl.registerFactory<CartRepos>(() => CartRepos(sl()));
  sl.registerFactory<OrdersRepo>(() => OrdersRepo(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));
  sl.registerFactory<OrdersCubit>(() => OrdersCubit(sl()));
  sl.registerFactory<SocialLinksCubit>(() => SocialLinksCubit(sl()));
  sl.registerFactory<WarehouseCubit>(() => WarehouseCubit(sl()));
  sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl()));
  sl.registerFactory<MedicineSearchCubit>(() => MedicineSearchCubit(sl()));
  // sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl()));
  sl.registerFactory<AppCubit>(() => AppCubit());

  // // await initHomeInj(sl);
  // await initNotificationsInj(sl);
  // await initOrdersInj(sl);
  // await initProductsInj(sl);
  // await initProfileInj(sl);
  await initOnBoardingInj(sl);
  await initBottomBarInj(sl);
}
