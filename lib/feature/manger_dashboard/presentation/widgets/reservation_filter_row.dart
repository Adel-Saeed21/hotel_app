import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/data/models/reservation_model.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_state.dart';

class ReservationsFilterRow extends StatelessWidget {
  const ReservationsFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerDashboardCubit, ManagerDashboardState>(
      builder: (context, state) {
        return Row(
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
            PopupMenuButton<States>(
              color: const Color(0xFFF5F7FA),
              icon: Icon(
                Icons.tune_rounded,
                color: AppColors.secondaryTextGrey,
                size: 22.sp,
              ),
              onSelected: (filter) {
                context.read<ManagerDashboardCubit>().changeFilter(filter);
              },
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: States.checkedIn,
                  child: Text('Checked In'),
                ),
                PopupMenuItem(
                  value: States.checkedOut,
                  child: Text('Checked Out'),
                ),
                PopupMenuItem(value: States.pending, child: Text('Pending')),
                PopupMenuItem(value: States.arriving, child: Text('Arriving')),
              ],
            ),
          ],
        );
      },
    );
  }
}
