import 'package:flutter/material.dart';

import '../../constant.dart';

class GreyFilledTextField extends StatelessWidget {
  const GreyFilledTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.isSecureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool isSecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecureText,
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
      borderRadius: BorderRadius.circular(8),
    );
  }
}
