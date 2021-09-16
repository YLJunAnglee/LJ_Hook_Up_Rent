import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_profile/advertisement.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button.dart';
import 'package:hook_up_rent/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('我的'),
        actions: [
          IconButton(
              onPressed: () {
                ApplicationRoutes.router.navigateTo(context, '/setting');
              },
              icon: Icon(Icons.settings)),
          TextButton(
              onPressed: () {
                ApplicationRoutes.router
                    .navigateTo(context, '/testImagePicker');
              },
              child: Text(
                '图片选择',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ],
      ),
      body: ListView(
        children: [
          ProfileHeader(),
          FunctionButton(),
          AdvertisementWidget(),
          InfoList(showTitle: true),
        ],
      ),
    );
  }
}
