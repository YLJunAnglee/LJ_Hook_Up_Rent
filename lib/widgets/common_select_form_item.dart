import 'package:flutter/material.dart';
import 'package:hook_up_rent/utiles/common_picker/index.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String? label;
  final int? value;
  final List<String>? options;
  final Function(int)? onChange;

  const CommonSelectFormItem(
      {Key? key, this.label, this.value, this.options, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuild: (context) {
        return Container(
          height: 40.0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              var picker = CommonPicker.showPicker(
                  context: context, options: options ?? [], value: value ?? 0);
              picker.then((selectedIndex) => {
                    if (selectedIndex != value &&
                        selectedIndex != null &&
                        onChange != null)
                      {onChange!(selectedIndex)}
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options![value ?? 0],
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
