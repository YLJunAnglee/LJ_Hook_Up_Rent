import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        children: [
          CommonSwipper(),
          IndexNavigator(),
          IndexCommend(),
          Text('这是内容区域'),
        ],
      ),
    );
  }
}