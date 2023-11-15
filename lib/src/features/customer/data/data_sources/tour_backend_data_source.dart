import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/customer/data/models/create_tour_res_model/create_tour_res_model.dart';

import 'package:wakaluxe/src/features/customer/data/models/create_tour_req_model/create_tour_req_model.dart';

part 'tour_backend_data_source.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class TourBackendDataSource {
  factory TourBackendDataSource(Dio dio) = _TourBackendDataSource;

  @POST('/api/v1/tours')
  Future<CreateTourResModel> createTour(
    @Header('Authorization') String idToken,
    @Body() CreateTourReqModel body,
  );
}
