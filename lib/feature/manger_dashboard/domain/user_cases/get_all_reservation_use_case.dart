import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/repo/manager_dashboard_repo.dart';

class GetAllReservationUseCase {
  final ManagerDashboardRepo managerDashboardRepo;

  GetAllReservationUseCase({required this.managerDashboardRepo});

  Future<ApiResult<List<ReservationModel>>> call() {
    return managerDashboardRepo.getManagerDashboardData();
  }
}