import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelapp/core/networking/api_error_model.dart';
import 'package:hotelapp/core/networking/api_result.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/user_cases/get_all_reservation_use_case.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'manager_dashboard_cubit_test.mocks.dart';

@GenerateMocks([GetAllReservationUseCase])
void main() {
  late final GetAllReservationUseCase mockGetAllReservationUseCase;
  late final ManagerDashboardCubit managerDashboardCubit;
  setUp(() {
    mockGetAllReservationUseCase = MockGetAllReservationUseCase();
    managerDashboardCubit = ManagerDashboardCubit(
      getAllReservationUseCase: mockGetAllReservationUseCase,
    );
  });

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

  blocTest<ManagerDashboardCubit, ManagerDashboardState>(
    'emit loading then success',
    build: () {
      when(
        mockGetAllReservationUseCase(),
      ).thenAnswer((_) async => ApiResult.success(reservation));

      return ManagerDashboardCubit(
        getAllReservationUseCase: mockGetAllReservationUseCase,
      );
    },
    act: (cubit) => cubit.getAllReservation(),
    expect: () => [
      const ManagerDashboardState(isLoading: true),
      ManagerDashboardState(reservations: reservation, isLoading: false),
    ],
  );

  blocTest<ManagerDashboardCubit, ManagerDashboardState>(
    'emit loading then error',
    build: () {
      when(mockGetAllReservationUseCase()).thenAnswer(
        (_) async => ApiResult.error(
          const ApiErrorModel(
            message: 'Exception: Failed to fetch data',
            type: ApiErrorType.connectionError,
            statusCode: 404,
          ),
        ),
      );

      return ManagerDashboardCubit(
        getAllReservationUseCase: mockGetAllReservationUseCase,
      );
    },
    act: (cubit) => cubit.getAllReservation(),
    expect: () => [
      const ManagerDashboardState(isLoading: true),
      const ManagerDashboardState(
        isLoading: false,
        errorMessage: 'Exception: Failed to fetch data',
      ),
    ],
  );
}
