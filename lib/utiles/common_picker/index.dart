import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/config/application_routes.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {required BuildContext context,
      required List<String> options,
      required int value,
      double height = 300}) {
    var buttonStyle = TextStyle(
        color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600);
    var controllerPage = FixedExtentScrollController(initialItem: value);
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.grey,
            height: 300,
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            ApplicationRoutes.router.pop(context);
                          },
                          child: Text(
                            '取消',
                            style: buttonStyle,
                          )),
                      TextButton(
                          onPressed: () {
                            ApplicationRoutes.router
                                .pop(context, controllerPage.selectedItem);
                          },
                          child: Text(
                            '确定',
                            style: buttonStyle,
                          )),
                    ],
                  ),
                ),
                Expanded(
                    child: CupertinoPicker(
                  scrollController: controllerPage,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (val) {},
                  children: options.map((e) => Text(e)).toList(),
                )),
              ],
            ),
          );
        });
  }
}
