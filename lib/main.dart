import 'package:flutter/material.dart';
import 'package:hotelapp/core/routing/app_route.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/hotel_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(HotelApp(appRouter: AppRoute(), initialRoute: Routes.startScreen));
}
