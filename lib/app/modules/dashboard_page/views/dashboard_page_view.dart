import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("E"),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.notifications_none),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Text(
              'Welcome to your Dashboard',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallContainer(
                        icon: Icons.add,
                        text: 'Add Claim',
                        onPressed: () {
                          Get.offAllNamed(Routes.EMPLOYEE_EXPENSE);
                        },
                      ),
                      _buildSmallContainer(
                        icon: Icons.request_page,
                        text: 'Request Advance',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallContainer(
                        icon: Icons.drafts,
                        text: 'Draft',
                        onPressed: () {},
                      ),
                      _buildSmallContainer(
                        icon: Icons.history,
                        text: 'History',
                        onPressed: () {
                          Get.offAllNamed(Routes.ALL_PAID_HISTORY);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallContainer(
                        icon: Icons.approval,
                        text: 'Claim Approvals',
                        onPressed: () {},
                      ),
                      _buildSmallContainer(
                        icon: Icons.currency_rupee_outlined,
                        text: 'Advance Approvals',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallContainer(
                        icon: Icons.stars_rounded,
                        text: 'Special Approvals',
                        onPressed: () {},
                      ),
                      _buildSmallContainer(
                        icon: Icons.verified_user,
                        text: 'CMD Approvals',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallContainer({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
