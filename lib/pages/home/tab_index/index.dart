import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/search_bar_index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(),
      ),
      body: ListView(
        children: [
          CommonSwipper(),
          IndexNavigator(),
          IndexCommend(),
          InfoList(showTitle: true),
        ],
      ),
    );
  }
}
