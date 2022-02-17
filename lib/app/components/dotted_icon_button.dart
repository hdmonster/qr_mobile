import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class DottedIconButton extends StatelessWidget {
  const DottedIconButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kPrimaryColor.withOpacity(.5),
      strokeWidth: .5,
      borderType: BorderType.RRect,
      radius: Radius.circular(4),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: MaterialButton(
          elevation: 0,
          color: Colors.white,
          padding: EdgeInsets.all(12),
          minWidth: double.infinity,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: kPrimaryColor),
              SizedBox(width: 12),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
