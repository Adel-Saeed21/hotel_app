import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';

abstract class ManagerDashboardRepo {
  Future<List<ReservationModel>> getManagerDashboardData();
}