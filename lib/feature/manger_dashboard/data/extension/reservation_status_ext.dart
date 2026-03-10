import 'package:flutter/material.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/widgets/reservation_card.dart';

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

  String get actionLabel {
    switch (this) {
      case ReservationStatus.arriving:
        return 'Check-in';
      case ReservationStatus.checkedIn:
        return 'Action Completed';
      case ReservationStatus.checkedOut:
        return 'Action Completed';
      case ReservationStatus.pending:
        return 'Review Request';
    }
  }

  IconData? get actionIcon {
    switch (this) {
      case ReservationStatus.arriving:
        return Icons.check_circle_outline_rounded;
      case ReservationStatus.checkedIn:
      case ReservationStatus.checkedOut:
      case ReservationStatus.pending:
        return null;
    }
  }

  Color get actionButtonColor {
    switch (this) {
      case ReservationStatus.arriving:
        return AppColors.buttonColorBabyBlue;
      case ReservationStatus.checkedIn:
      case ReservationStatus.checkedOut:
      case ReservationStatus.pending:
        return Colors.transparent;
    }
  }

  Color get actionTextColor {
    switch (this) {
      case ReservationStatus.arriving:
        return AppColors.textButtonWhite;
      case ReservationStatus.checkedIn:
      case ReservationStatus.checkedOut:
        return AppColors.secondaryTextGrey;
      case ReservationStatus.pending:
        return AppColors.normalTextBlack;
    }
  }

  bool get showContactButtons {
    return this == ReservationStatus.arriving;
  }

  bool get isActionDisabled {
    return this == ReservationStatus.checkedIn ||
        this == ReservationStatus.checkedOut;
  }
}