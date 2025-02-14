import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.strName,
    required this.strValue,
    this.color,
  });

  final String strName, strValue;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(strName,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        Text(strValue,
            style: TextStyle(
              fontSize: 19,
              color: color ?? Colors.black,
            )),
      ],
    );
  }
}
