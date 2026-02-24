import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/core/current_user/domain/entities/user.dart';
import 'package:hotelapp/core/current_user/domain/use_case/get_current_user_use_case.dart';
import 'package:hotelapp/core/current_user/domain/use_case/update_profile_image_use_case.dart';
import 'package:hotelapp/core/current_user/domain/use_case/update_user_use_case.dart';
import 'package:hotelapp/core/current_user/presentation/logic/current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final UpdateProfileImageUseCase _updateProfileImageUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  CurrentUserCubit({
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required UpdateProfileImageUseCase updateProfileImageUseCase,
    required UpdateUserUseCase updateUserUseCase,
  }) : _getCurrentUserUseCase = getCurrentUserUseCase,
       _updateProfileImageUseCase = updateProfileImageUseCase,
       _updateUserUseCase = updateUserUseCase,
       super(const CurrentUserInitial());

  Future<void> loadUser() async {
    try {
      emit(const CurrentUserLoading());
      final user = await _getCurrentUserUseCase.call();
      emit(CurrentUserLoaded(user));
    } catch (e) {
      emit(CurrentUserError('Failed to load user: $e'));
    }
  }

  Future<void> updateProfileImage(File imageFile) async {
    final currentState = state;
    if (currentState is! CurrentUserLoaded) {
      emit(const CurrentUserError('No user loaded'));
      return;
    }

    try {
      emit(CurrentUserUpdatingImage(currentState.user));
      await _updateProfileImageUseCase.call(imageFile);
      final updatedUser = await _getCurrentUserUseCase.call();
      emit(CurrentUserImageUpdated(updatedUser));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(CurrentUserLoaded(updatedUser));
    } catch (e) {
      emit(CurrentUserError('Failed to update image: $e'));
      emit(CurrentUserLoaded(currentState.user));
    }
  }

  
  User? get currentUser {
    final currentState = state;
    if (currentState is CurrentUserLoaded) return currentState.user;
    if (currentState is CurrentUserUpdating) return currentState.user;
    if (currentState is CurrentUserUpdatingImage) return currentState.user;
    if (currentState is CurrentUserImageUpdated) return currentState.user;
    if (currentState is CurrentUserUpdated) return currentState.user;
    return null;
  }

  String? get role => currentUser!.role;

  bool get isAdmin => role?.toLowerCase() == 'admin';

  bool get isUser => role?.toLowerCase() == 'user';
}
