import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/utils/register_lazy_if_not_registered.dart';
import 'package:hotelapp/feature/manger_dashboard/data/data_source/manager_dashboard_remote_data_source.dart';
import 'package:hotelapp/feature/manger_dashboard/data/repo_impl/manager_dashboard_repo_impl.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/repo/manager_dashboard_repo.dart';
import 'package:hotelapp/feature/manger_dashboard/domain/user_cases/get_all_reservation_use_case.dart';
import 'package:hotelapp/feature/manger_dashboard/presentation/logic/manager_dashboard_cubit.dart';

void managerDashboardScreenDi() {
  if (getIt.isRegistered<ManagerDashboardCubit>()) return;

  registerLazyIfNotRegistered<ManagerDashboardRemoteDataSource>(
    () => ManagerDashboardRemoteDataSourceImpl(networkService: getIt()),
  );

  registerLazyIfNotRegistered<ManagerDashboardRepo>(
    () => ManagerDashboardRepoImpl(
      managerDashboardRemoteDataSource: getIt<ManagerDashboardRemoteDataSource>(),
    ),
  );

  registerLazyIfNotRegistered<GetAllReservationUseCase>(
    () => GetAllReservationUseCase(managerDashboardRepo: getIt<ManagerDashboardRepo>()),
  );

  getIt.registerFactory<ManagerDashboardCubit>(
    () => ManagerDashboardCubit(getAllReservationUseCase: getIt<GetAllReservationUseCase>()),
  );
}