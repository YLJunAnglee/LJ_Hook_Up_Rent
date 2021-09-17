import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/widgets/common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(
      {required this.title, required this.iconPoint, required this.isChecked});
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem(title: '衣柜', iconPoint: 0xe918, isChecked: false),
  RoomApplianceItem(title: '洗衣机', iconPoint: 0xe917, isChecked: false),
  RoomApplianceItem(title: '空调', iconPoint: 0xe90d, isChecked: false),
  RoomApplianceItem(title: '天然气', iconPoint: 0xe90f, isChecked: false),
  RoomApplianceItem(title: '冰箱', iconPoint: 0xe907, isChecked: false),
  RoomApplianceItem(title: '暖气', iconPoint: 0xe910, isChecked: false),
  RoomApplianceItem(title: '电视', iconPoint: 0xe908, isChecked: false),
  RoomApplianceItem(title: '热水器', iconPoint: 0xe912, isChecked: false),
  RoomApplianceItem(title: '宽带', iconPoint: 0xe90e, isChecked: false),
  RoomApplianceItem(title: '沙发', iconPoint: 0xe913, isChecked: false),
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({Key? key, required this.onChange}) : super(key: key);

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> _list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 20.0,
        children: _list
            .map((e) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _list = _list
                          .map((eItem) => (eItem == e
                              ? RoomApplianceItem(
                                  title: e.title,
                                  iconPoint: e.iconPoint,
                                  isChecked: !e.isChecked)
                              : eItem))
                          .toList();
                    });
                    widget.onChange(_list);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Icon(
                          IconData(e.iconPoint, fontFamily: Config.CommonIcon),
                          size: 40.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(e.title),
                        SizedBox(height: 10.0),
                        CommonCheckButton(isChecked: e.isChecked)
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplicanceList extends StatelessWidget {
  final List<String>? list;

  const RoomApplicanceList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showList = _dataList
        .where((element) => (list ?? []).contains(element.title))
        .toList();
    if (showList.length == 0) {
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text('暂无房屋配置信息'),
      );
    }
    return Container(
      child: Wrap(
        runSpacing: 20.0,
        children: showList
            .map((e) => Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(e.iconPoint, fontFamily: Config.CommonIcon),
                        size: 40.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(e.title),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
