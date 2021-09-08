import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/dataList.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

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
        title: Text('TabSearch'),
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
