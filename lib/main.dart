import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_compras/helper/dependencies.dart' as dep;
import 'package:app_compras/global/constant/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialBinding: dep.InitBinding(),
      initialRoute: Routes.getWelcomeView(),
      getPages: Routes.getPages,
    ),
  );
}

