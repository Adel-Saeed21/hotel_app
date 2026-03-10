import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/dahsboard_header.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/dashboard_stats_section.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservation_filter_row.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservations_list_section.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/room_service_banner.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ManagerDashboardCubit>()..loadDummyReservations(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(),
                    verticalSpace(20),
                    const DashboardStatsSection(),
                    verticalSpace(12),
                    const RoomServiceBanner(),
                    verticalSpace(20),
                    const ReservationsFilterRow(),
                    verticalSpace(14),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: const ReservationsListSection(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
