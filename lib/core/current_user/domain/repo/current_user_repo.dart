import 'dart:io';

import 'package:hotelapp/core/current_user/domain/entities/user.dart';


abstract class CurrentUserRepository {
  Future<User> getCurrentUser();
  Future<void> updateProfileImage(File imageFile);
  Future<void> updateUser(User user);
}
