import 'package:hive/hive.dart';
import 'package:hotelapp/core/current_user/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String country;
  @HiveField(5)
  final String city;
  @HiveField(6)
  final String address;
  @HiveField(7)
  final String role;
  @HiveField(8)
  final String? loginToken;
  @HiveField(9)
  final String? profileImagePath;
  @HiveField(10)
  final String? id;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.role,
    this.loginToken,
    this.profileImagePath, this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    return User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
      address: address,
      role: role,
      loginToken: loginToken,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      country: user.country,
      city: user.city,
      address: user.address,
      role: user.role,
      loginToken: user.loginToken,
    );
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? country,
    String? city,
    String? address,
    String? role,
    String? loginToken,
    String? profileImagePath,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      role: role ?? this.role,
      loginToken: loginToken ?? this.loginToken,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }
}
