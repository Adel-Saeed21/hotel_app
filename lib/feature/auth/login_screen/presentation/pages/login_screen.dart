import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/logic/login_cubit.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/pages/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),

      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginBody(),
      ),
    );
  }
}
