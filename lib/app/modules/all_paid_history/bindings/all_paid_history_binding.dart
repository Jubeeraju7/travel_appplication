import 'package:get/get.dart';

import '../controllers/all_paid_history_controller.dart';

class AllPaidHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPaidHistoryController>(
      () => AllPaidHistoryController(),
    );
  }
}
