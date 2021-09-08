import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/routes.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> navigatorItemList = [
  IndexNavigatorItem('整租', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    ApplicationRoutes.router.navigateTo(context, Routes.login);
  }),
  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    ApplicationRoutes.router.navigateTo(context, Routes.login);
  }),
  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    ApplicationRoutes.router.navigateTo(context, Routes.login);
  }),
  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    ApplicationRoutes.router.navigateTo(context, Routes.login);
  })
];
