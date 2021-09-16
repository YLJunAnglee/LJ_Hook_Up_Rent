import 'package:flutter/material.dart';
import 'package:hook_up_rent/utiles/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                CommonToast.showToast('您已退出登陆');
              },
              child: Text('退出登陆'))
        ],
      ),
    );
  }
}
