import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class RoomServiceBanner extends StatelessWidget {
  const RoomServiceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.buttonColorBabyBlue,
            AppColors.buttonColorBabyBlue.withOpacity(0.75),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonColorBabyBlue.withOpacity(0.35),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ← Icon Container
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.room_service_rounded,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          horizontalSpace(12),
          // ← Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Room Service Status",
                  style: TextStyle(
                    color: AppColors.textButtonWhite,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpace(4),
                Text(
                  "4 active requests requiring attention",
                  style: TextStyle(
                    color: AppColors.textButtonWhite.withOpacity(0.85),
                    fontWeight: FontWeightHelper.regular,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          // ← View Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textButtonWhite,
              foregroundColor: AppColors.buttonColorBabyBlue,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              "View",
              style: TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
