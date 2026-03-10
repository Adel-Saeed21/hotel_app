import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_state.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/stats_card.dart';

class DashboardStatsSection extends StatelessWidget {
  const DashboardStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        BlocBuilder<ManagerDashboardCubit, ManagerDashboardState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  icon: Icons.login_rounded,
                  count: state.checkInCount.toString(),
                  label: 'Check-ins',
                  iconColor: AppColors.checkInIconColor,
                  iconBackgroundColor: AppColors.checkInIconBg,
                ),
                StatCard(
                  icon: Icons.logout_rounded,
                  count: state.checkOutCount.toString(),
                  label: 'Check-outs',
                  iconColor: AppColors.checkOutIconColor,
                  iconBackgroundColor: AppColors.checkOutIconBg,
                ),
                StatCard(
                  icon: Icons.pending_actions_rounded,
                  count: state.pendingCount.toString(),
                  label: 'Pending',
                  iconColor: AppColors.pendingIconColor,
                  iconBackgroundColor: AppColors.pendingIconBg,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}