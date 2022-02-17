import 'package:flutter/material.dart';

import '../../constant.dart';

class DescribeTextfield extends StatelessWidget {
  const DescribeTextfield({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 4,
      maxLines: 6,
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        fillColor: kLightGrey,
        hintText: hint,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: outlineBorder(),
        focusedBorder: outlineBorder(),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
