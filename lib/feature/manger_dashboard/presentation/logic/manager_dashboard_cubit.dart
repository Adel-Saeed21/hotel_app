import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/user_cases/get_all_reservation_use_case.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_state.dart';

class ManagerDashboardCubit extends Cubit<ManagerDashboardState> {
  final GetAllReservationUseCase getAllReservationUseCase;

  ManagerDashboardCubit({required this.getAllReservationUseCase})
    : super(const ManagerDashboardState());

  Future<void> getAllReservation() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getAllReservationUseCase();
    result.when(
      onSuccess: (data) {
        emit(state.copyWith(isLoading: false, reservations: data));
      },
      onError: (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.message));
      },
    );
  }

  void loadDummyReservations() {
    final dummyList = [
      const ReservationModel(
        id: 1,
        gustName: 'Sarah Jenkins',
        gustPhone: '+201234567890',
        roomType: 'Deluxe King',
        roomNumber: 304,
        checkInDate: '2025-03-10',
        checkOutDate: '2025-03-15',
        state: States.arriving,
      ),
      const ReservationModel(
        id: 2,
        gustName: 'Ahmed Hassan',
        gustPhone: '+201098765432',
        roomType: 'Suite',
        roomNumber: 501,
        checkInDate: '2025-03-09',
        checkOutDate: '2025-03-12',
        state: States.checkedIn,
      ),
      const ReservationModel(
        id: 3,
        gustName: 'Emily Clark',
        gustPhone: '+201122334455',
        roomType: 'Standard Twin',
        roomNumber: 210,
        checkInDate: '2025-03-11',
        checkOutDate: '2025-03-13',
        state: States.pending,
      ),
      const ReservationModel(
        id: 4,
        gustName: 'Mohamed Ali',
        gustPhone: '+201566778899',
        roomType: 'Family Room',
        roomNumber: 402,
        checkInDate: '2025-03-08',
        checkOutDate: '2025-03-10',
        state: States.checkedOut,
      ),
      const ReservationModel(
        id: 5,
        gustName: 'Laura White',
        gustPhone: '+201011223344',
        roomType: 'Deluxe Queen',
        roomNumber: 315,
        checkInDate: '2025-03-10',
        checkOutDate: '2025-03-14',
        state: States.checkedIn,
      ),
    ];

    emit(state.copyWith(reservations: dummyList));
  }

  void checkIn(int reservationId) {
    final updatedReservations = state.reservations.map((reservation) {
      if (reservation.id == reservationId) {
        return ReservationModel(
          id: reservation.id,
          gustName: reservation.gustName,
          gustPhone: reservation.gustPhone,
          roomType: reservation.roomType,
          roomNumber: reservation.roomNumber,
          checkInDate: reservation.checkInDate,
          checkOutDate: reservation.checkOutDate,
          state: States.checkedIn,
        );
      }
      return reservation;
    }).toList();

    emit(state.copyWith(reservations: updatedReservations));
  }

  void changeFilter(States filter) {
    emit(state.copyWith(filter: filter));
  }
}
