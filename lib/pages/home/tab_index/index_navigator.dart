import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator_item.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList
            .map((e) => InkWell(
                  child: Column(
                    children: [
                      Container(
                        width: 95 / 2,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CommonImage(
                            e.imageUri,
                            width: 95 / 2,
                          ),
                          // child: Image.asset(
                          //   e.imageUri,
                          //   width: 95 / 2,
                          // ),
                        ),
                      ),
                      Text(
                        e.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  onTap: () {
                    e.onTap(context);
                  },
                ))
            .toList(),
      ),
    );
  }
}
