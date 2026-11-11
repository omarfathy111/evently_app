import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
   final String? textName;
  final TextStyle? style;
  const TextWidget({super.key,this.textName ,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      textName ?? '',
      style: style,
    );
  }
}
