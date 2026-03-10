// reservation_status_ext.dart
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservation_card.dart';

extension StatesToReservationStatus on States {
  ReservationStatus toReservationStatus() {
    switch (this) {
      case States.checkedIn:
        return ReservationStatus.checkedIn;
      case States.checkedOut:
        return ReservationStatus.checkedOut;
      case States.pending:
        return ReservationStatus.pending;
      case States.arriving:
        return ReservationStatus.arriving;
    }
  }
}