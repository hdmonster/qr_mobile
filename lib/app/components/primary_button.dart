import 'package:flutter/material.dart';

import '../../constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = 'default',
    this.isLoading = false,
  }) : super(key: key);

  final String label;
  final String variant;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(13),
      color: isLoading ? kPrimaryColor.withOpacity(.4) : kPrimaryColor,
      minWidth: variant == 'default' ? double.infinity : 100,
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              child: CircularProgressIndicator(color: kWhite, strokeWidth: 2),
              height: 16,
              width: 16,
            )
          : Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
