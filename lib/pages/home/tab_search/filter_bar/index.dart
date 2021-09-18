import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/Item.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utiles/common_picker/index.dart';
import 'package:hook_up_rent/utiles/scopped_model_helper.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  FilterBar({Key? key, required this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var picker = CommonPicker.showPicker(
        context: context,
        options: areaList.map((e) => e.name).toList(),
        value: 0);
    picker.then((value) {
      if (value == null) return;
      setState(() {
        areaId = areaList[value].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var picker = CommonPicker.showPicker(
        context: context,
        options: rentTypeList.map((e) => e.name).toList(),
        value: 0);
    picker.then((value) {
      if (value == null) return;
      setState(() {
        rentTypeId = rentTypeList[value].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });
    var picker = CommonPicker.showPicker(
        context: context,
        options: priceList.map((e) => e.name).toList(),
        value: 0);
    picker.then((value) {
      if (value == null) return;
      setState(() {
        priceId = priceList[value].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange() {
    var selectedMoreIds =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreIds: selectedMoreIds.toList(),
          priceTypeId: '',
          moreId: []));
    }
  }

  _getData() {
    var newDataList = Map<String, List<GeneralType>>();
    newDataList['roomTypeList'] = roomTypeList;
    newDataList['orientedList'] = orientedList;
    newDataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = newDataList;
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer.run(() {
      _getData();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterItem(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          FilterItem(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          FilterItem(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          FilterItem(
            title: '筛选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
