import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wakaluxe/features/payments/data/models/init_payment_req_model.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

part 'backend_payment_data_source.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class BackendPaymentDataSource {
  factory BackendPaymentDataSource(Dio dio) = _BackendPaymentDataSource;

  @POST('/api/v1/bookings/initiatePayment')
  Future<HttpResponse> initPayment(
    @Header('Authorization') String idToken,
    @Body() InitPaymentReqModel body,
  );

  @POST('api/v1/bookings/completePayment')
  Future<HttpResponse> completePayment(
    @Header('Authorization') String idToken, 
    @Body() Map<String, dynamic> body
  );
}
