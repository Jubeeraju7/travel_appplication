import 'package:get/get.dart';

class AllPaidHistoryController extends GetxController {
  //TODO: Implement AllPaidHistoryController

 final List<Map<String, String>> trips = [
    {'tripId': '12345', 'Amount': '18000', 'status': 'Pending', 'date': '03/09/2023'},
    {'tripId': '12346', 'Amount': '2000', 'status': 'Paid', 'date': '20/09/2023'},
    {'tripId': '12347', 'Amount': '25000', 'status': 'Rejected', 'date': '22/09/2023'},
    {'tripId': '12348', 'Amount': '10000', 'status': 'Paid', 'date': '22/09/2023'},
  ];
  List<Map<String, String>> filterTrips(String statusFilter) {
    if (statusFilter == 'All') return trips;
    return trips.where((trip) => trip['status'] == statusFilter).toList();
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
