import 'package:get/get.dart';

import '../controllers/employee_expense_controller.dart';

class EmployeeExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeExpenseController>(
      () => EmployeeExpenseController(),
    );
  }
}
