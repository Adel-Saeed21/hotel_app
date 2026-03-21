import 'package:flutter_test/flutter_test.dart';
import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/manger_dashboard/data/data_source/manager_dashboard_remote_data_source.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/data/repo_impl/manager_dashboard_repo_impl.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/repo/manager_dashboard_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockManagerDashboardRemoteDataSource extends Mock
    implements ManagerDashboardRemoteDataSource {}

void main() {
  late ManagerDashboardRemoteDataSource mockManagerDashboardRemoteDataSource;
  late ManagerDashboardRepo managerDashboardRepo;

  setUp(() {
    mockManagerDashboardRemoteDataSource = MockManagerDashboardRemoteDataSource();
    managerDashboardRepo = ManagerDashboardRepoImpl(
      managerDashboardRemoteDataSource: mockManagerDashboardRemoteDataSource,
    );
  });

  test('ManagerDashboardRepoImpl should return list of ReservationModel', () async {
    final reservation = List.generate(
      5,
      (index) => ReservationModel(
        id: index,
        gustName: 'Guest $index',
        gustPhone: '123-456-7890',
        roomType: 'Deluxe',
        roomNumber: index + 1,
        checkInDate: DateTime.now().toString(),
        checkOutDate: DateTime.now().add(const Duration(days: 1)).toString(),
        state: States.arriving,
      ),
    );

    when(() => mockManagerDashboardRemoteDataSource.getGuestReservationData()) 
        .thenAnswer((_) async => ApiResult.success(reservation));

    final result = await managerDashboardRepo.getManagerDashboardData();

    expect(result, isA<ApiSuccess<List<ReservationModel>>>());
    final success = result as ApiSuccess<List<ReservationModel>>;
    expect(success.data.length, reservation.length);
  });
}