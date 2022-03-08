import 'package:connect/app/modules/splash/splash_binding.dart';
import 'package:connect/app/modules/splash/splash_page.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/themes/colors_theme.dart';
import 'package:connect/app/utils/app_config.dart';
import 'package:connect/app/utils/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.[[FLAVOR_NAME]], values: null, hasDealer: true);

  await AppConfig().startInitialConfiguration();

  runApp(IkonConnectApp());
}

class IkonConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ikon Connect',
      theme: ThemeColor().themeData.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
