import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/icon_action_button.dart';


enum ReservationStatus { arriving, checkedIn, checkedOut, pending }

extension ReservationStatusExt on ReservationStatus {
  String get label {
    switch (this) {
      case ReservationStatus.arriving:
        return 'ARRIVING';
      case ReservationStatus.checkedIn:
        return 'CHECKED IN';
      case ReservationStatus.checkedOut:
        return 'CHECKED OUT';
      case ReservationStatus.pending:
        return 'PENDING';
    }
  }

  Color get textColor {
    switch (this) {
      case ReservationStatus.arriving:
        return const Color(0xFF2E7D32);
      case ReservationStatus.checkedIn:
        return const Color(0xFF1565C0);
      case ReservationStatus.checkedOut:
        return const Color(0xFF6D4C41);
      case ReservationStatus.pending:
        return const Color(0xFFE65100);
    }
  }

  Color get bgColor {
    switch (this) {
      case ReservationStatus.arriving:
        return const Color(0xFFE8F5E9);
      case ReservationStatus.checkedIn:
        return const Color(0xFFE3F2FD);
      case ReservationStatus.checkedOut:
        return const Color(0xFFEFEBE9);
      case ReservationStatus.pending:
        return const Color(0xFFFFF3E0);
    }
  }
}


class ReservationCard extends StatelessWidget {
  const ReservationCard({
    super.key,
    required this.guestName,
    required this.roomInfo,
    required this.status,
    required this.onCheckIn,
    required this.onCall,
    required this.onMessage,
    this.guestImagePath,
  });

  final String guestName;
  final String roomInfo;
  final ReservationStatus status;
  final VoidCallback onCheckIn;
  final VoidCallback onCall;
  final VoidCallback onMessage;
  final String? guestImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Guest Info Row
          Row(
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: guestImagePath != null
                    ? Image.asset(
                        guestImagePath!,
                        width: 52.w,
                        height: 52.h,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 52.w,
                        height: 52.h,
                        color: const Color(0xFFE0E0E0),
                        child: Icon(
                          Icons.person,
                          size: 28.sp,
                          color: Colors.grey,
                        ),
                      ),
              ),
              horizontalSpace(12),
              // Name & Room
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guestName,
                      style: TextStyle(
                        color: AppColors.normalTextBlack,
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 15.sp,
                      ),
                    ),
                    verticalSpace(3),
                    Text(
                      roomInfo,
                      style: TextStyle(
                        color: AppColors.secondaryTextGrey,
                        fontWeight: FontWeightHelper.regular,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: status.bgColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  status.label,
                  style: TextStyle(
                    color: status.textColor,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(14),
          // Action Buttons Row
          Row(
            children: [
              // Check-in Button
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColorBabyBlue,
                    foregroundColor: AppColors.textButtonWhite,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: onCheckIn,
                  icon: Icon(Icons.check_circle_outline_rounded, size: 18.sp),
                  label: Text(
                    "Check-in",
                    style: TextStyle(
                      fontWeight: FontWeightHelper.semiBold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              horizontalSpace(10),
              // Call Button
              IconActionButton(
                icon: Icons.phone_rounded,
                onTap: onCall,
              ),
              horizontalSpace(10),
              // Message Button
              IconActionButton(
                icon: Icons.chat_bubble_outline_rounded,
                onTap: onMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}