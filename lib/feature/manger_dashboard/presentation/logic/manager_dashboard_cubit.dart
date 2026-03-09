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

  void changeFilter(States filter) {
    emit(state.copyWith(filter: filter));
  }
}
