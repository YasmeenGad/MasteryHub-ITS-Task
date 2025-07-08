// import 'dart:io';
// import 'package:dio/dio.dart' hide DioMediaType;
// //
// import 'api_constants.dart';
//
// part 'api_manager.g.dart';
//
// @singleton
// @injectable
// @RestApi(baseUrl: ApiConstants.baseUrl)
// abstract class ApiManager {
//   @factoryMethod
//   factory ApiManager(Dio dio) = _ApiManager;
//
//   @POST(ApiConstants.apply)
//   @MultiPart()
//   Future<ApplyResponseDto> applyDriver(
//       @Part(name: 'country') String country,
//       @Part(name: 'firstName') String firstName,
//       @Part(name: 'lastName') String lastName,
//       @Part(name: 'vehicleType') String vechicleType,
//       @Part(name: 'vehicleNumber') String vechicleNumber,
//       @Part(name: 'vehicleLicense', contentType: 'image/jpeg')
//       File vechicleLicense,
//       @Part(name: 'NID') String nID,
//       @Part(name: 'NIDImg', contentType: 'image/jpeg') File nIDImg,
//       @Part(name: 'email') String email,
//       @Part(name: 'password') String password,
//       @Part(name: 'rePassword') String rePassword,
//       @Part(name: 'gender') String gender,
//       @Part(name: 'phone') String phone);
//
//   @POST(ApiConstants.signInApi)
//   Future<LoginResponseDto> login(@Body() LoginRequestDto request);
//
//   @POST(ApiConstants.registerApi)
//   Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto request);
//
//   @POST(ApiConstants.forgotPasswordApi)
//   Future<ForgetPasswordResponseDto> forgetPassword(
//       @Body() ForgetPasswordRequestDto request);
//
//   @POST(ApiConstants.verifyResetCodeApi)
//   Future<VerifyResetCodeResponseDto> verifyResetCode(
//       @Body() VerifyResetCodeRequestDto resetCode);
//
//   @PUT(ApiConstants.resetPasswordApi)
//   Future<ResetPasswordResponseDto> resetPassword(
//       @Body() ResetPasswordRequestDto resetPassword);
//
//   @GET(ApiConstants.getLoggedDriverData)
//   Future<GetLoggedDriverDataResponseDto> getLoggedDriverData();
//
//   @PUT(ApiConstants.editProfile)
//   Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> body);
//
//
//   @PUT(ApiConstants.uploadPhoto)
//   @MultiPart()
//   Future<UploadPhotoResponseDto> uploadPhoto(
//     @Part(name: "photo") File photo,
//   );
//   @GET(ApiConstants.getAllVehicles)
//   Future<GetAllVehiclesDto> getAllVehicles();
//
//   @PATCH(ApiConstants.changePassword)
//   Future<ChangePasswordResponseDto> changePassword(
//       @Body() ChangePasswordRequestDto request);
//
//   @GET(ApiConstants.getPendingOrders)
//   Future<PendingOrderResponseDto> getPendingOrders(@Query("limit") int limit);
//
//   @GET(ApiConstants.getDriverOrders)
//   Future<DriverOrderResponseDto> getDriverOrders(@Query("limit") int limit);
//
//   @PUT("${ApiConstants.startOrder}{id}")
//   Future<void> startOrder(@Path("id") String id);
//
//   @PUT("${ApiConstants.updateOrder}{id}")
//   Future<void> changeOrderStatus(@Path("id") String id,@Body() ChangeOrderStateDto state);
// }
