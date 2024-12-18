import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';
import '../controllers/employee_expense_controller.dart';

class EmployeeExpenseView extends GetView<EmployeeExpenseController> {
  const EmployeeExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD_PAGE);
          },
        ),
        title: const Text(
          'New Claim',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100.0,
                  width: Get.width,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildInfoRow('Employee ID:', 'Basic Location:'),
                        _buildInfoRow('John Doe', 'CA HQ'),
                      ],
                    ),
                  )),
              SizedBox(height: 20),
              Text(
                'Claim Form',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                height: 2.0,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              _buildInputField('Type of Trip'),
              SizedBox(height: 20),
              _buildInputField('Branch Name'),
              SizedBox(height: 20),
              _buildInputField('Purpose of trip'),
              SizedBox(height: 20),
              Text(
                'Select Transportation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              _buildTransportationOption('Air', controller.airSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Train', controller.trainSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Cab', controller.cabSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Lodging', controller.lodgingSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Food', controller.foodSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Bus', controller.busSelected),
              SizedBox(height: 10),
              _buildTransportationOption('Fuel', controller.fuelSelected),
              SizedBox(height: 10),
              _buildTransportationOption(
                  'Entertainment', controller.entertainmentSelected),
              SizedBox(height: 20),
              _buildSeparatorContainer('Air'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Train'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Cab'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Lodging'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Food'),
              SizedBox(height: 10),
              _buildSeparatorContainer('bus'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Fuel'),
              SizedBox(height: 10),
              _buildSeparatorContainer('Entaintment'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        print("Save Draft Pressed");
                      },
                      child: const Text(
                        'Save Draft',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        print("Continue Pressed");
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              leftText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              rightText,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to build input fields with labels
  Widget _buildInputField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Enter $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to build transportation options
  Widget _buildTransportationOption(String name, RxBool isSelected) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          isSelected.toggle();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected.value ? Colors.blue[100] : Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isSelected.value,
                onChanged: (value) {
                  isSelected.toggle();
                },
                activeColor: Colors.blue,
              ),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build separate containers for labels
  Widget _buildSeparatorContainer(String label) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
