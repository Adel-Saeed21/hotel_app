import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'reservation_model.g.dart';

@JsonSerializable()
class ReservationModel extends Equatable {
  final int id;
  final String gustName;
  final String gustPhone;
  final String roomType;
  final int roomNumber;
  final String checkInDate;
  final String checkOutDate;
  final States state;

  const ReservationModel({
    required this.id,
    required this.gustName,
    required this.gustPhone,
    required this.roomType,
    required this.roomNumber,
    required this.checkInDate,
    required this.checkOutDate,
    required this.state,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        gustName,
        gustPhone,
        roomType,
        roomNumber,
        checkInDate,
        checkOutDate,
        state,
      ];
}
enum States { pending, arriving, checkedIn, checkedOut }
