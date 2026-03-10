import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/manger_dashboard/data/extension/reservation_status_ext.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/icon_action_button.dart';

enum ReservationStatus { arriving, checkedIn, checkedOut, pending }

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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4.w,
              decoration: BoxDecoration(
                color: status.textColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(14.r),
                child: Column(
                  children: [
                    // Guest Info Row
                    Row(
                      children: [
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
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
                        Expanded(
                          child: status.actionIcon != null
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: status.actionButtonColor,
                                    foregroundColor: status.actionTextColor,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  onPressed: status.isActionDisabled
                                      ? null
                                      : onCheckIn,
                                  icon: Icon(status.actionIcon, size: 18.sp),
                                  label: Text(
                                    status.actionLabel,
                                    style: TextStyle(
                                      fontWeight: FontWeightHelper.semiBold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                              : status.isActionDisabled
                              ? Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        size: 16.sp,
                                        color: AppColors.secondaryTextGrey,
                                      ),
                                      horizontalSpace(6),
                                      Text(
                                        status.actionLabel,
                                        style: TextStyle(
                                          fontWeight: FontWeightHelper.semiBold,
                                          fontSize: 14.sp,
                                          color: AppColors.secondaryTextGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: status.actionTextColor,
                                    side: BorderSide(
                                      color: AppColors.normalTextBlack
                                          .withOpacity(0.15),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  onPressed: onCheckIn,
                                  child: Text(
                                    status.actionLabel,
                                    style: TextStyle(
                                      fontWeight: FontWeightHelper.semiBold,
                                      fontSize: 14.sp,
                                      color: status.actionTextColor,
                                    ),
                                  ),
                                ),
                        ),

                        if (status.showContactButtons) ...[
                          horizontalSpace(10),
                          IconActionButton(
                            icon: Icons.phone_rounded,
                            onTap: onCall,
                          ),
                          horizontalSpace(10),
                          IconActionButton(
                            icon: Icons.chat_bubble_outline_rounded,
                            onTap: onMessage,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
