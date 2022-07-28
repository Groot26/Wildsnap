import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String userId;
  final String text;

  Comment({required this.text, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.no_accounts_rounded, size: 50),
                Text(userId),
                Spacer(),
                Icon(
                  Icons.heart_broken,
                  size: 20,
                )
              ],
            ),
            Row(
              children: [Text(text)],
            )
          ],
        ),
      ),
    );
  }
}
