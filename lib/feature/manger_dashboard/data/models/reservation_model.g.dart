// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: (json['id'] as num).toInt(),
      gustName: json['gustName'] as String,
      gustPhone: json['gustPhone'] as String,
      roomType: json['roomType'] as String,
      roomNumber: (json['roomNumber'] as num).toInt(),
      checkInDate: json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] as String,
      state: $enumDecode(_$StatesEnumMap, json['state']),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gustName': instance.gustName,
      'gustPhone': instance.gustPhone,
      'roomType': instance.roomType,
      'roomNumber': instance.roomNumber,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'state': _$StatesEnumMap[instance.state]!,
    };

const _$StatesEnumMap = {
  States.pending: 'pending',
  States.arriving: 'arriving',
  States.checkedIn: 'checkedIn',
  States.checkedOut: 'checkedOut',
};
