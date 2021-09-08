import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_data.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_item.dart';

class IndexCommend extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexCommend({Key? key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /// 背景色
      decoration: BoxDecoration(color: Color(0x08000000)),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('房屋推荐',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              Text('更多', style: TextStyle(color: Colors.black54)),
            ],
          ),
          SizedBox(height: 10.0),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: dataList.map((e) => IndexRecommendItemWidget(e)).toList(),
          ),
        ],
      ),
    );
  }
}
