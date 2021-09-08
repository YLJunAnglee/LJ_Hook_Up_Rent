import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index.dart';
import 'package:hook_up_rent/pages/home/tab_info/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pageList = [
    TabIndex(),
    TabSearch(),
    TabInfoList(),
    PageContent(name: '我的'),
  ];

  List<BottomNavigationBarItem> _tabBarItems = [
    BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: '找房', icon: Icon(Icons.search)),
    BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
    BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
