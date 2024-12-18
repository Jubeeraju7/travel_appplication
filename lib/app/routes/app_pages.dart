import 'package:get/get.dart';
import 'package:travel_app/app/modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/all_paid_history/bindings/all_paid_history_binding.dart';
import '../modules/all_paid_history/views/all_paid_history_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/employee_expense/bindings/employee_expense_binding.dart';
import '../modules/employee_expense/views/employee_expense_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/paid_history/bindings/paid_history_binding.dart';
import '../modules/paid_history/views/paid_history_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => const DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_EXPENSE,
      page: () => const EmployeeExpenseView(),
      binding: EmployeeExpenseBinding(),
    ),
    GetPage(
      name: _Paths.PAID_HISTORY,
      page: () => const PaidHistoryView(trip: {},),
      binding: PaidHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PAID_HISTORY,
      page: () => const AllPaidHistoryView(),
      binding: AllPaidHistoryBinding(),
    ),
  ];
}
