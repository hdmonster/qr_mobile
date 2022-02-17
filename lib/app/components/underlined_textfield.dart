import 'package:flutter/material.dart';

import '../../constant.dart';

class UnderlinedTextField extends StatelessWidget {
  const UnderlinedTextField({
    Key? key,
    required this.label,
    this.initialValue = null,
    this.controller = null,
    this.readonly = false,
  }) : super(key: key);

  final String? label;
  final String? initialValue;
  final TextEditingController? controller;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: UnderlineInputBorder(),
        focusColor: kPrimaryColor,
      ),
      readOnly: readonly,
      controller:
          readonly ? TextEditingController(text: initialValue) : controller,
    );
  }
}
