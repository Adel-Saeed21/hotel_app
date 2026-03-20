import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        verticalSpace(15),
        Text(
          "Dashboard",
          style: TextStyle(
            color: AppColors.normalTextBlack,
            fontWeight: FontWeightHelper.medium,
            fontSize: 28.sp,
          ),
        ),
        Text(
          "Here's what's happening today.",
          style: TextStyle(
            color: AppColors.secondaryTextGrey,
            fontWeight: FontWeightHelper.regular,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}