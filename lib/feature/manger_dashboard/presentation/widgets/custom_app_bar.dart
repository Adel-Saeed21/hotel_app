import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/utils/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.role,
    required this.name,
    this.notificationCount = 0,
    this.onNotificationTap,
    this.profileImagePath,
  });

  final String role;
  final String name;
  final int notificationCount;
  final VoidCallback? onNotificationTap;
  final String? profileImagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: profileImagePath != null
              ? Image.file(
                  File(profileImagePath!),
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  Assets.assetsImagesUser,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
        ),
        horizontalSpace(10),

        // Role & Name
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.secondaryTextGrey,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ],
        ),

        const Spacer(),

        // Notification Bell
        GestureDetector(
          onTap: onNotificationTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.notifications,
                size: 28.sp,
                color: AppColors.secondaryTextGrey,
              ),
              if (notificationCount > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        notificationCount > 9 ? '9+' : '$notificationCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
