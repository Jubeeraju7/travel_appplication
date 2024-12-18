import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';
import '../controllers/all_paid_history_controller.dart';

class AllPaidHistoryView extends StatefulWidget {
  const AllPaidHistoryView({Key? key}) : super(key: key);

  @override
  State<AllPaidHistoryView> createState() => _AllPaidHistoryViewState();
}

class _AllPaidHistoryViewState extends State<AllPaidHistoryView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AllPaidHistoryController controller =
      Get.put(AllPaidHistoryController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD_PAGE);
          },
        ),
        title: const Text(
          'History',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Color.fromRGBO(3, 162, 236, 1),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Pending'),
                Tab(text: 'Paid'),
                Tab(text: 'Rejected'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildListView('All'),
                  _buildListView('Pending'),
                  _buildListView('Paid'),
                  _buildListView('Rejected'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(String statusFilter) {
    final filteredTrips = controller.filterTrips(statusFilter);
    return ListView.builder(
      itemCount: filteredTrips.length,
      itemBuilder: (context, index) {
        final trip = filteredTrips[index];
        return GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.PAID_HISTORY);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trip ID ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    ' Date     ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${trip['tripId']} ',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${trip['date']}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(' ${trip['status']}'),
                      Text('${trip['Amount'] ?? 'N/A'}'),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
