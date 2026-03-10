
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/data/extension/reservation_state_ext.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/helpers/launcher_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_state.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservation_card.dart';

class ReservationsListSection extends StatelessWidget {
  const ReservationsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerDashboardCubit, ManagerDashboardState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        if (state.filteredReservations.isEmpty) {
          return Center(
            child: Text(
              "No reservations found.",
              style: TextStyle(
                color: AppColors.secondaryTextGrey,
                fontSize: 14.sp,
              ),
            ),
          );
        }

        final previewList = state.filteredReservations.take(3).toList();
        final hasMore = state.filteredReservations.length > 3;

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: previewList.length,
                separatorBuilder: (_, __) => verticalSpace(12),
                itemBuilder: (context, index) {
                  final reservation = previewList[index];
                  return ReservationCard(
                    guestName: reservation.gustName,
                    roomInfo:
                        '${reservation.roomType} (${reservation.roomNumber})',
                    status: reservation.state.toReservationStatus(),
                    onCheckIn: () {
                      context
                          .read<ManagerDashboardCubit>()
                          .checkIn(reservation.id);
                    },
                    onCall: () => LauncherHelper.launchPhone(reservation.gustPhone),
                    onMessage: () => LauncherHelper.launchSms(reservation.gustPhone),
                  );
                },
              ),
            ),
            if (hasMore) ...[
              verticalSpace(8),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to All Reservations Screen
                },
                child: Text(
                  "View All Reservations",
                  style: TextStyle(
                    color: AppColors.buttonColorBabyBlue,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
            verticalSpace(12),
          ],
        );
      },
    );
  }
}