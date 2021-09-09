import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  /// 是否展示位置按钮
  final bool? showLoaction;

  /// 返回按钮函数
  final Function? goBackCallback;

  /// 搜索框输入值
  final String? inputValue;

  /// 搜索框默认值
  final String? defaultInputValue;

  /// 是否展示取消按钮
  final Function? onCancel;

  /// 是否展示地图按钮
  final bool? showMap;

  /// 用户点击搜索框触发
  final Function? onSearch;

  /// 用户输入搜索词后，点击触发
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.showLoaction,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _txtController;
  String _searchWord = '';
  void _onClear() {
    setState(() {
      _searchWord = '';
      _txtController.clear();
    });
  }

  /// 初始化函数
  @override
  void initState() {
    // TODO: implement initState
    _txtController = TextEditingController(text: widget.inputValue);
    _searchWord = widget.inputValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showLoaction != null)
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.room,
                      color: Colors.green,
                      size: 16.0,
                    ),
                  ),
                  Container(
                    child: Text(
                      '北京',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ),
          if (widget.goBackCallback != null)
            GestureDetector(
                onTap: () {
                  widget.goBackCallback!();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 26.0,
                  ),
                )),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: 10.0),
            height: 34.0,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17.0)),
            padding: EdgeInsets.only(right: 10.0),
            child: TextField(
              controller: _txtController,
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              onTap: () {
                if (widget.onSearch != null) {
                  widget.onSearch!();
                }
              },
              onSubmitted: (String value) {
                if (widget.onSearchSubmit != null) {
                  widget.onSearchSubmit!(value);
                }
              },
              textInputAction: TextInputAction.search,
              style: TextStyle(color: Colors.black, fontSize: 14.0),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 4.0, left: -12.0),
                hintText: widget.defaultInputValue,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                border: InputBorder.none,
                icon: Container(
                  padding: EdgeInsets.only(left: 6.0, top: 4.0),
                  child: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _onClear();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.clear,
                      size: 18.0,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          )),
          if (widget.onCancel != null)
            GestureDetector(
              onTap: () {
                widget.onCancel!();
              },
              child: Text(
                '取消',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
          if (widget.showMap != null)
            Container(
              padding: EdgeInsets.only(top: 3.0, left: 10.0),
              child: CommonImage('static/icons/widget_search_bar_map.png'),
            )
        ],
      ),
    );
  }
}
