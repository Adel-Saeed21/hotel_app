import 'dart:io';

import 'package:hotelapp/core/current_user/data/models/user_model.dart';
import 'package:hotelapp/core/current_user/domain/entities/user.dart';
import 'package:hotelapp/core/current_user/domain/repo/current_user_repo.dart';
import 'package:hotelapp/core/data_source/local_data_soruce/user_local_data_source.dart';



class CurrentUserRepositoryImpl implements CurrentUserRepository {
  final UserLocalDataSource _localDataSource;
  
  CurrentUserRepositoryImpl({required UserLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<User> getCurrentUser() async {
    final userModel = await _localDataSource.getCurrentUser();
    return userModel.toEntity();
  }

  @override
  Future<void> updateProfileImage(File imageFile) async {
    final imagePath = await _localDataSource.saveImageLocally(imageFile);
    await _localDataSource.updateProfileImage(imagePath);
  }

  @override
  Future<void> updateUser(User user) async {
    final userModel = UserModel.fromEntity(user);
    await _localDataSource.updateUser(userModel);
  }
}