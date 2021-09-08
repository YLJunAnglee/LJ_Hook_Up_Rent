import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend_data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

var textStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var indexItemWidth = (MediaQuery.of(context).size.width - 30) / 2;
    return GestureDetector(
      onTap: () {
        ApplicationRoutes.router.navigateTo(context, data.navigateUri);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(10.0),
        width: indexItemWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(data.title, style: textStyle),
                Text(data.subTitle, style: textStyle),
              ],
            ),
            CommonImage(
              data.imageUri,
              width: 55.0,
            )
          ],
        ),
      ),
    );
  }
}
