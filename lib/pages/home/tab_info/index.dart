import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';

class TabInfoList extends StatefulWidget {
  TabInfoList({Key? key}) : super(key: key);

  @override
  _TabInfoListState createState() => _TabInfoListState();
}

class _TabInfoListState extends State<TabInfoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资讯tab'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10.0),
          InfoList(),
          InfoList(),
          InfoList(),
        ],
      ),
    );
  }
}
