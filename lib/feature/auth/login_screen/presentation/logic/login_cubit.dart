import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
}
