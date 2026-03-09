import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';

class ManagerDashboardState {
  final List<ReservationModel> reservations;
  final States filter;
  final bool isLoading;
  final String? errorMessage;

  const ManagerDashboardState({
    this.reservations = const [],
    this.filter = States.checkedIn,
    this.isLoading = false,
    this.errorMessage,
  });

  List<ReservationModel> get filteredReservations {
    switch (filter) {
      case States.checkedIn:
        return reservations.where((e) => e.state == States.checkedIn).toList();
      case States.checkedOut:
        return reservations.where((e) => e.state == States.checkedOut).toList();
      case States.pending:
        return reservations.where((e) => e.state == States.pending).toList();
      case States.arriving:
        throw UnimplementedError();
    }
  }

  int get checkInCount => 
      reservations.where((e) => e.state == States.checkedIn).length;
  int get checkOutCount => 
      reservations.where((e) => e.state == States.checkedOut).length;
  int get pendingCount => 
      reservations.where((e) => e.state == States.pending).length;

  ManagerDashboardState copyWith({
    List<ReservationModel>? reservations,
    States? filter,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ManagerDashboardState(
      reservations: reservations ?? this.reservations,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}