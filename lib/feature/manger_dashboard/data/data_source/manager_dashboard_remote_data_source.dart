import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/api_error_handler.dart';
import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
abstract class ManagerDashboardRemoteDataSource {
  Future<ApiResult<List<ReservationModel>>> getGuestReservationData();
}

class ManagerDashboardRemoteDataSourceImpl
    implements ManagerDashboardRemoteDataSource {
  final NetworkService networkService;
  ManagerDashboardRemoteDataSourceImpl({required this.networkService});

  @override
Future<ApiResult<List<ReservationModel>>> getGuestReservationData() async {
  try {
    final result = await networkService.get(ApiConst.getAllReservations);
    final data = result.data
        .map<ReservationModel>((e) => ReservationModel.fromJson(e))
        .toList();
    return ApiResult.success(data);
  } catch (e) {
    return ApiResult.error(ApiErrorHandler.handle(e));
  }
}
}