import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_image_picker.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:hook_up_rent/widgets/common_select_form_item.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class RoomAddPage extends StatefulWidget {
  RoomAddPage({Key? key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int _selectedLeaseValue = 0;
  int _selectedFurnishValue = 0;
  int roomType = 0;
  int floorType = 0;
  int orientedType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
      ),
      body: ListView(
        children: [
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuild: (context) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  ApplicationRoutes.router.navigateTo(context, '/search');
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 44.0,
                  child: Text(
                    '请选择小区',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
            suffix: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                ApplicationRoutes.router.navigateTo(context, '/search');
              },
              child: Container(
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: ['一室', '两室', '三室', '四室'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floorType,
            onChange: (val) {
              setState(() {
                floorType = val;
              });
            },
            options: ['高楼层', '中楼层', '低楼层'],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: orientedType,
            onChange: (val) {
              setState(() {
                orientedType = val;
              });
            },
            options: ['东', '南', '西', '北'],
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: ['合租', '整租'],
            value: _selectedLeaseValue,
            onChange: (index) {
              setState(() {
                _selectedLeaseValue = index;
              });
            },
          ),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: _selectedFurnishValue,
            onChange: (index) {
              setState(() {
                _selectedFurnishValue = index;
              });
            },
          ),
          CommonTitle('房屋图像'),
          CommonImagePicker(),
          CommonTitle('房屋标题'),
          CommonTitle('房屋配置'),
          CommonTitle('房屋描述'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
    );
  }
}
