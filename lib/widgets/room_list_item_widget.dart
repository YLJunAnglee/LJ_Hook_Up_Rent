import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/dataList.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          CommonImage(
            data.imageUri ?? '',
            width: 132.5,
            height: 100.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  data.subTitle ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children:
                      (data.tags ?? []).map((e) => Text(e + ',')).toList(),
                ),
                Text(
                  '${data.price} 元/月',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
