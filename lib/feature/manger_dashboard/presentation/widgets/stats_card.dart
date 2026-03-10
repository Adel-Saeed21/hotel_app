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
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      width: 105.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: iconColor.withOpacity(0.15),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, size: 22.sp, color: iconColor),
          ),
          verticalSpace(12),
          Text(
            count,
            style: TextStyle(
              color: AppColors.normalTextBlack,
              fontWeight: FontWeightHelper.bold,
              fontSize: 24.sp,
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
