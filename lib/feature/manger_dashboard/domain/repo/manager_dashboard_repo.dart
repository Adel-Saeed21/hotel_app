import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';

abstract class ManagerDashboardRepo {
  Future<ApiResult<List<ReservationModel>>> getManagerDashboardData();
}