import 'package:get/get.dart';

import '../controllers/paid_history_controller.dart';

class PaidHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PaidHistoryController(),
    );
  }
}
