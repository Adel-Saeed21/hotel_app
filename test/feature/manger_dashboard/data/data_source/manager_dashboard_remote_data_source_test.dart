import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelapp/core/networking/api_const.dart';
import 'package:hotelapp/core/networking/network_service.dart';
import 'package:hotelapp/feature/manger_dashboard/data/data_source/manager_dashboard_remote_data_source.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'manager_dashboard_remote_data_source_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late final ManagerDashboardRemoteDataSourceImpl
  managerDashboardRemoteDataSourceImpl;
  late final NetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    managerDashboardRemoteDataSourceImpl = ManagerDashboardRemoteDataSourceImpl(
      networkService: mockNetworkService,
    );
  });
  group('Get all reservation', () {
    test('Get all reservation will be success', () async {
      final reservation = List.generate(
        5,
        (index) => ReservationModel(
          id: index,
          gustName: 'Guest $index',
          gustPhone: '123-456-7890',
          roomType: 'Deluxe',
          roomNumber: index + 1,
          checkInDate: DateTime.now().toString(),
          checkOutDate: DateTime.now().add(Duration(days: 1)).toString(),
          state: States.arriving,
        ),
      );

      when(mockNetworkService.get(ApiConst.getAllReservations)).thenAnswer(
        (_) async => Response(
          data: reservation.map((e) => e.toJson()).toList(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ApiConst.getAllReservations),
        ),
      );
      final result = await managerDashboardRemoteDataSourceImpl
          .getGuestReservationData();

      expect(result, reservation);
    });
  });
}
