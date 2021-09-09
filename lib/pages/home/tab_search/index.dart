import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/pages/home/tab_search/dataList.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar_index.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key? key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(
          showLoaction: true,
          showMap: true,
          onSearch: () {
            ApplicationRoutes.router.navigateTo(context, '/search');
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 40.0,
            child: Text('filterBar'),
          ),
          Expanded(
            child: ListView(
              children: dataList
                  .map((e) => RoomListItemWidget(
                        e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
