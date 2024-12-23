import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: theme,
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
      getPages :AppPages.routes ,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!);
      },
    );
  }
}
