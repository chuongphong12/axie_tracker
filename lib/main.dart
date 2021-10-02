import 'app/modules/auth/controllers/auth_binding.dart';
import 'app/utils/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Axie Tracker",
      initialBinding: AuthBinding(),
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: Root(),
    ),
  );
}
