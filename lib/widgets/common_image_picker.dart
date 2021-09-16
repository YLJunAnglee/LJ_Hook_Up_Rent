import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<XFile>?>? onChange;

  const CommonImagePicker({Key? key, this.onChange}) : super(key: key);

  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<XFile>? _imageFileList = [];
  set _imageFile(XFile? value) {
    if (value != null) {
      _imageFileList = _imageFileList!..add(value);
    }
  }

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  dynamic _pickImageError;

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: [
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter maxWidth if desired',
                  ),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter maxHeight if desired',
                  ),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter quality if desired',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    ApplicationRoutes.router.pop(context);
                  },
                  child: Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    ApplicationRoutes.router.pop(context);
                  },
                  child: Text('PICK'))
            ],
          );
        });
  }

  void _chooseLocalImage(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (maxWidth, maxHeight, quality) async {
        try {
          final pickedFileList = await _picker.pickMultiImage(
              maxHeight: maxHeight, maxWidth: maxWidth, imageQuality: quality);
          setState(() {
            _imageFileList = pickedFileList;
            if (widget.onChange != null) {
              widget.onChange!(_imageFileList);
            }
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (maxWidth, maxHeight, quality) async {
        try {
          final pickedFile = await _picker.pickImage(
              source: source,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality);
          setState(() {
            _imageFile = pickedFile;
            if (widget.onChange != null) {
              widget.onChange!(_imageFileList);
            }
          });
        } catch (e) {
          _pickImageError = e;
        }
      });
    }
  }

  Widget _addButtonWidget(BuildContext context, double width, double height) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _chooseLocalImage(ImageSource.gallery, context: context);
      },
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _contentImageWidget(double width, double height, XFile file) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.file(
          File(file.path),
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
        Positioned(
          right: -20.0,
          top: -20.0,
          child: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                _imageFileList = _imageFileList!..remove(file);
                if (widget.onChange != null) {
                  widget.onChange!(_imageFileList);
                }
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var itemWidth = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = itemWidth / imageWidgetHeightRatio;
    List<Widget> widgetList = (_imageFileList ?? [])
        .map((e) => _contentImageWidget(itemWidth, height, e))
        .toList()
          ..add(_addButtonWidget(context, itemWidth, height));
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: widgetList,
      ),
    );
  }
}
