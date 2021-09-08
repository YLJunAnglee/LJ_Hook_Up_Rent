import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/routes.dart';

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面: $name'),
      ),
      body: ListView(
        children: [
          TextButton(
            child: Text(Routes.home),
            onPressed: () {
              ApplicationRoutes.router.navigateTo(context, Routes.home);
            },
          ),
          TextButton(
            child: Text(Routes.login),
            onPressed: () {
              ApplicationRoutes.router.navigateTo(context, Routes.login);
            },
          ),
          TextButton(
            child: Text('不存在的页面'),
            onPressed: () {
              ApplicationRoutes.router.navigateTo(context, '/aaaaaa');
            },
          ),
          TextButton(
            child: Text('房屋详情页'),
            onPressed: () {
              ApplicationRoutes.router
                  .navigateTo(context, '${Routes.roomDetail}?roomId=110119');
            },
          ),
        ],
      ),
    );
  }
}
