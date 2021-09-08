import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

/// 宽750px 高424px
const List<String> defaultImgs = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg'
];

class CommonSwipper extends StatelessWidget {
  final List<String> images;

  const CommonSwipper({Key? key, this.images = defaultImgs}) : super(key: key);

  /// 轮播图组件
  Widget _swipperWidget() {
    return AspectRatio(
      aspectRatio: 750 / 424,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _swipperWidget();
  }
}
