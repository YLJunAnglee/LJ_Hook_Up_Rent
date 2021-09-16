import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String? label;
  final Widget Function(BuildContext context)? contentBuild;
  final Widget? suffix;
  final String? suffixText;
  final String? hintText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem(
      {Key? key,
      this.label,
      this.contentBuild,
      this.suffix,
      this.suffixText,
      this.hintText,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 1.0, color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            child: Text(
              label ?? '占位符',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ),
          Expanded(
              child: (contentBuild != null)
                  ? contentBuild!(context)
                  : TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                      ))),
          (suffix != null) ? suffix! : Text(suffixText ?? ''),
        ],
      ),
    );
  }
}
