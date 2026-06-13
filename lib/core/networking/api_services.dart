import 'package:dio/dio.dart';
import 'package:drug_flow/core/networking/endPoints.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:drug_flow/features/Auths/forgot_password/data/forget_password_response.dart';
import 'package:drug_flow/features/Auths/register/data/governorate_model.dart';
import 'package:drug_flow/features/Auths/register/data/register_request_body.dart';
import 'package:drug_flow/features/Auths/register/data/register_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/add_to_cart_request.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/data/update_cart_item_request.dart';
import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/home/data/slider_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_order/create_order_params.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/create_review/create_review.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/order_statuses_response.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_request.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/coupon_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/faqs_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/get_profile/profile_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/models/update_profile_request_body.dart';
import 'package:drug_flow/features/Home_sction/profile/data/social_links_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/Auths/login/data/models/login_request_body.dart';
import '../../features/Auths/login/data/models/login_response.dart';
import 'package:drug_flow/features/Auths/otp/data/otp_response.dart';

import '../../features/Home_sction/orders/domain/entities/create_order/create_order.dart';
import '../../features/Home_sction/orders/domain/entities/create_review/create_review_params.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody body);
  @GET(ApiConstants.slides)
  Future<SliderResponse> slides();
  @GET(ApiConstants.warehouses)
  Future<WarehouseResponse> warehouses();
  @GET("${ApiConstants.warehouses}/{id}")
  Future<WarehouseDetailsResponse> warehouseDetails(
    @Path('id') int id, {
    // sort
    @Query('sort') String? sort,
    // medicine_ids[] — Retrofit sends List<int> as repeated params
    @Queries() Map<String, dynamic>? filters,
  });
  @GET(ApiConstants.products)
  Future<ProductsResponse> products({
    @Query('sort') String? sort,
    @Queries() Map<String, dynamic>? filters,
  });
  @POST(ApiConstants.register)
  @MultiPart()
  Future<AuthResponseModel> register(@Body() FormData body);
  @GET(ApiConstants.governorates)
  Future<GovernoratesResponse> governorates();
  @GET(ApiConstants.medicine)
  Future<FilterListResponse> medicine();
  @POST(ApiConstants.updateProfile)
  @MultiPart()
  Future<ProfileResponse> updateProfile(@Body() UpdateProfileRequestBody body);
  @GET('/faqs')
  Future<FaqsResponse> getFaqs();
  @GET(ApiConstants.search)
  Future<HttpResponse<dynamic>> searchMedicines(@Query('search') String query);
  @GET(ApiConstants.coupons)
  Future<CouponResponse> coupons();
  @GET(ApiConstants.ingrade)
  Future<FilterListResponse> ingrdiante();
  @GET('/social-links')
  Future<SocialLinksResponse> getSocialLinks();
  @POST(ApiConstants.contactUs)
  Future<ContactResponse> contactUs(@Body() ContactRequest body);
  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile();
  @POST(ApiConstants.resendCode)
  Future<OtpResponseModel> resendCode(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.forgetPassword)
  Future<ForgetResponseModel> forgetpassword(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() Map<String, dynamic> body,
  );
  @GET(ApiConstants.myCart)
  Future<CartResponseModel> getMyCarts({@Query('is_drafted') int? isDrafted});
  @DELETE("${ApiConstants.deleteCart}/{id}")
  Future<CartResponseModel> deleteCartItem(@Path('id') int id);
  @POST("${ApiConstants.updateCart}/{id}")
  Future<CartResponseModel> updateCartItem(
    @Path('id') int id,
    @Body() UpdateCartItemRequest body,
  );
  @POST(ApiConstants.addToCart)
  Future<CartResponseModel> addToCart(@Body() AddToCartRequest body);
  @DELETE("${ApiConstants.deleteWholeCart}/{id}")
  Future<CartResponseModel> deleteWholeCart(@Path('id') int id);
  @POST("/orders/cart/{id}/draft")
  Future<CartResponseModel> saveCartAsDraft(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );
  @DELETE(ApiConstants.deleteAccount)
  Future<DeleteAccountResponse> deleteAccount();

  @POST(ApiConstants.createOrder)
  Future<CreateOrderResponse> createOrder(@Body() CreateOrderParams body);

  @POST(ApiConstants.createReview)
  Future<CreateReviewResponse> createReview(@Body() CreateReviewParams body);

  @GET(ApiConstants.myOrders)
  Future<MyOrdersResponse> getMyOrders(
    // @Query("status") String? status,
  );
  @GET(ApiConstants.orderStatuses)
  Future<OrderStatusesResponse> getOrderStatuses();
  @GET("${ApiConstants.orderDetails}/{id}")
  Future<OrderDetailsResponse> getOrderDetails(@Path("id") int orderId);
}
