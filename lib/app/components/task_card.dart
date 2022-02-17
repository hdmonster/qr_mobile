import 'package:flutter/material.dart';

import '../../../../constant.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.isAccepted,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final String date;
  final bool isAccepted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: kPrimaryColor.withAlpha(20),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      color: isAccepted ? kIris : kWhite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isAccepted ? kWhite : kPrimaryColor,
              ),
            ),
            SizedBox(height: 9),
            Container(
              height: 48,
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: isAccepted ? kWhite : kDarkGrey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: isAccepted ? kWhite : kPrimaryColor,
                  ),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    isAccepted ? 'Lihat' : 'Terima',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isAccepted ? kWhite : kOrange,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
