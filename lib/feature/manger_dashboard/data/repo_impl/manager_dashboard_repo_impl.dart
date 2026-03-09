import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/manger_dashboard/data/data_source/manager_dashboard_remote_data_source.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/repo/manager_dashboard_repo.dart';

class ManagerDashboardRepoImpl extends ManagerDashboardRepo {
  final ManagerDashboardRemoteDataSource managerDashboardRemoteDataSource;

  ManagerDashboardRepoImpl({required this.managerDashboardRemoteDataSource});

  @override
  Future<ApiResult<List<ReservationModel>>> getManagerDashboardData() {
    return managerDashboardRemoteDataSource.getGuestReservationData();
  }
}
