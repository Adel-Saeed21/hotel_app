import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  final IconData icon;
  final String count;
  final String label;
  final Color iconColor;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      width: 105.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColors.normalTextBlack.withOpacity(0.07),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
        color: AppColors.authBackgroundOffWhite,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, size: 20.sp, color: iconColor),
          ),
          verticalSpace(10),
          Text(
            count,
            style: TextStyle(
              color: AppColors.normalTextBlack,
              fontWeight: FontWeightHelper.bold,
              fontSize: 22.sp,
            ),
          ),
          verticalSpace(2),
          Text(
            label,
            style: TextStyle(
              color: AppColors.secondaryTextGrey,
              fontWeight: FontWeightHelper.regular,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
