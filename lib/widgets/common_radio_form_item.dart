import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String? label;
  final List<String>? options;
  final int? value;
  final int? radioValue;
  final ValueChanged<int>? onChange;

  const CommonRadioFormItem(
      {Key? key,
      this.label,
      this.options,
      this.value,
      this.radioValue,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuild: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              options!.length,
              (index) => Row(
                    children: [
                      Radio<int>(
                          value: index,
                          groupValue: value,
                          onChanged: (idx) {
                            onChange!(idx ?? 0);
                          }),
                      Text(options![index])
                    ],
                  )),
        );
      },
    );
  }
}
