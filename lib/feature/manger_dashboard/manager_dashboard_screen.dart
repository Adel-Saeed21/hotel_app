import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservation_card.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/stats_card.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              role: 'MANAGER',
              name: 'Sarah Wilson',
              notificationCount: 1,
              onNotificationTap: () {},
            ),
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
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Overview",
                  style: TextStyle(
                    color: AppColors.normalTextBlack,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 18.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: AppColors.buttonColorBabyBlue,
                      fontWeight: FontWeightHelper.medium,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  icon: Icons.login_rounded,
                  count: '12',
                  label: 'Check-ins',
                  iconColor: AppColors.checkInIconColor,
                  iconBackgroundColor: AppColors.checkInIconBg,
                ),
                StatCard(
                  icon: Icons.logout_rounded,
                  count: '8',
                  label: 'Check-outs',
                  iconColor: AppColors.checkOutIconColor,
                  iconBackgroundColor: AppColors.checkOutIconBg,
                ),
                StatCard(
                  icon: Icons.pending_actions_rounded,
                  count: '3',
                  label: 'Pending',
                  iconColor: AppColors.pendingIconColor,
                  iconBackgroundColor: AppColors.pendingIconBg,
                ),
              ],
            ),
            verticalSpace(12),
            Container(
              width: double.infinity,
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // ignore: deprecated_member_use
                    AppColors.buttonColorBabyBlue.withOpacity(0.9),
                    // ignore: deprecated_member_use
                    AppColors.buttonColorBabyBlue.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      verticalSpace(6),
                      Text(
                        "4 active requests requiring attention",
                        style: TextStyle(
                          color: AppColors.textButtonWhite,
                          fontWeight: FontWeightHelper.regular,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textButtonWhite,
                      foregroundColor: AppColors.buttonColorBabyBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
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
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Reservations",
                  style: TextStyle(
                    color: AppColors.normalTextBlack,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 18.sp,
                  ),
                ),
                Icon(
                  Icons.tune_rounded,
                  color: AppColors.secondaryTextGrey,
                  size: 22.sp,
                ),
              ],
            ),
            verticalSpace(14),
            ReservationCard(
              guestName: 'Sarah Jenkins',
              roomInfo: 'Deluxe King (304)',
              status: ReservationStatus.arriving,
              onCheckIn: () {},
              onCall: () {},
              onMessage: () {},
            ),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
