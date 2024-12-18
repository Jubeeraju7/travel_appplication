import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';

class PaidHistoryView extends StatelessWidget {
  final Map<String, dynamic> trip;

  const PaidHistoryView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAllNamed(Routes.ALL_PAID_HISTORY);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Trip ID ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Date ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                trip['tripId'] ?? 'N/A',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                trip['tripDate'] ?? 'N/A',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 20, thickness: 1),
                  Container(
                    height: 100,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _infoRow(
                              'Type of Trip :', trip['typeOfTrip'] ?? 'N/A'),
                          _infoRow(
                              'Branch Name :', trip['branchName'] ?? 'N/A'),
                          _infoRow('Purpose of Trip :',
                              trip['purposeOfTrip'] ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 160,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _infoRow('Reporting Person approval : ',
                                trip['reportingPerson'] ?? 'N/A'),
                            _infoRow('Final Approval :',
                                trip['finalApproval'] ?? 'N/A'),
                            const Divider(height: 20, thickness: 1),
                            const SizedBox(height: 10),
                            _infoRow('Paid Date :', trip['paidDate'] ?? 'N/A'),
                            _infoRow('Approved Finance person :',
                                trip['financePerson'] ?? 'N/A'),
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  const Divider(height: 20, thickness: 1),
                  Text(
                    ' Submitted Categories:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildCategoryList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryContainer(String title) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.category, color: Colors.blueAccent, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryList() {
    List<String> categories = [
      'Air',
      'Train',
      'Cab',
      'Lodging',
      'Food',
      'Bus',
      'Fuel',
      'Entertainment'
    ];
    return Column(
      children:
          categories.map((category) => _categoryContainer(category)).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaidHistoryView(
      trip: {
        'tripId': '12345',
        'tripDate': '2024-12-15',
        'typeOfTrip': 'Business',
        'branchName': 'Main Branch',
        'purposeOfTrip': 'Client meeting',
        'reportingPerson': 'John Doe',
        'finalApproval': 'Jane Smith',
        'paidDate': '2024-12-16',
        'financePerson': 'Michael Scott',
      },
    ),
  ));
}
