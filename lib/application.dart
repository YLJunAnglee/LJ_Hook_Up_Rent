import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/routes.dart';

class ApplicationApp extends StatelessWidget {
  /// 初始化方法
  ApplicationApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    ApplicationRoutes.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: ApplicationRoutes.router.generator,
      theme: ThemeData(primaryColor: Colors.green),
      home: HomePage(),
    );
  }
}
