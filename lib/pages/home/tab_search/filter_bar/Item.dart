import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function(BuildContext) onTap;

  const FilterItem(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Colors.green : Colors.black87;
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (onTap != null) {
            onTap(context);
          }
        },
        child: Row(
          children: [
            Text(title, style: TextStyle(color: color, fontSize: 18.0)),
            Icon(
              Icons.arrow_drop_down,
              size: 20.0,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
