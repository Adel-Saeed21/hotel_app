// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      email: fields[2] as String,
      phoneNumber: fields[3] as String,
      country: fields[4] as String,
      city: fields[5] as String,
      address: fields[6] as String,
      role: fields[7] as String,
      loginToken: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.role)
      ..writeByte(8)
      ..write(obj.loginToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      role: json['role'] as String,
      loginToken: json['loginToken'] as String?,
      profileImagePath: json['profileImagePath'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'city': instance.city,
      'address': instance.address,
      'role': instance.role,
      'loginToken': instance.loginToken,
      'profileImagePath': instance.profileImagePath,
    };
