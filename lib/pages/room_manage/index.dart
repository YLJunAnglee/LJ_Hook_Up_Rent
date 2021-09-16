import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/pages/home/tab_search/dataList.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CommonFloatingActionButton('发布房源', (context) {
            ApplicationRoutes.router.navigateTo(context, '/roomAdd');
          }),
          appBar: AppBar(
            title: Text('RoomManage'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: '空置',
                ),
                Tab(
                  text: '已租',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: dataList
                    .map((e) => RoomListItemWidget(
                          e,
                        ))
                    .toList(),
              ),
              ListView(
                children: dataList
                    .map((e) => RoomListItemWidget(
                          e,
                        ))
                    .toList(),
              )
            ],
          ),
        ));
  }
}
