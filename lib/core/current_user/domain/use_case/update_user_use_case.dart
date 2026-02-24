
import 'package:hotelapp/core/current_user/domain/entities/user.dart';
import 'package:hotelapp/core/current_user/domain/repo/current_user_repo.dart';

class UpdateUserUseCase {
  final CurrentUserRepository _repository;
  UpdateUserUseCase(this._repository);
  Future<void> call(User user) async {
    return await _repository.updateUser(user);
  }
}