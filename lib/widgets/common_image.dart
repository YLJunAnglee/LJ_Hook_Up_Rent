import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

final networkUriReg = RegExp('^http');
final localUriReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? hold;

  const CommonImage(this.src,
      {Key? key, this.width, this.height, this.fit, this.hold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String holdString = 'static/images/default_small_img.webp';
    if (hold != null) {
      if (hold!.isNotEmpty) {
        holdString = hold!;
      }
    }
    BoxFit boxFit = BoxFit.fill;
    if (fit != null) {
      boxFit = fit!;
    }
    if (src.isEmpty) {
      return Image.asset(
        holdString,
        width: width,
        height: height,
        fit: boxFit,
      );
    }
    if (networkUriReg.hasMatch(src)) {
      return CachedNetworkImage(
        imageUrl: src,
        placeholder: (context, url) => Image.asset(
          holdString,
          fit: BoxFit.fill,
        ),
        width: width,
        height: height,
        fit: boxFit,
      );
    }
    if (localUriReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: boxFit,
      );
    }
    return Container();
  }
}
