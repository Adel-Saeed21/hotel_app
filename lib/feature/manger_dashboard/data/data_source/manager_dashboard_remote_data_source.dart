import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';

abstract class ManagerDashboardRemoteDataSource {
  Future<List<ReservationModel>> getGuestReservationData();
}

class ManagerDashboardRemoteDataSourceImpl
    implements ManagerDashboardRemoteDataSource {
  final NetworkService networkService;
  ManagerDashboardRemoteDataSourceImpl({required this.networkService});
  @override
  Future<List<ReservationModel>> getGuestReservationData() async {
    final result = await networkService.get(ApiConst.getAllReservations);
    return result.data
        .map<ReservationModel>((e) => ReservationModel.fromJson(e))
        .toList();
  }
}
