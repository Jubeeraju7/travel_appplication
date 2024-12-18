import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';
import 'package:travel_app/provider.dart';

class LoginPageController extends GetxController {
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    final String employeeId = employeeIdController.text.trim();
    final String password = passwordController.text.trim();

    if (employeeId.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Employee ID and Password cannot be empty");
      return;
    }
    Map<String, dynamic> body = {
      "employeeid": employeeId,
      "employeename": password,
    };
    try {
      isLoading.value = true;
      final response = await LoginProvider().login(jsondata: body);
      isLoading.value = false;
      if (response["code"] == 200) {
        Get.offAllNamed(Routes.DASHBOARD_PAGE);
      } else {
        Get.snackbar("Error", "Server error");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  @override
  void onClose() {
    employeeIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
