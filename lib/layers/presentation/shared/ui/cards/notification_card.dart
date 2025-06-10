import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({Key? key, required this.title, required this.body}) : super(key: key);

  String title;
  String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(247, 247, 249, 1),
      ),
      width: 335,
      height: 140,
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 16),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: FittedBox (child: Text(this.title))),
            SizedBox(height: 8),
            FittedBox (child: Text(this.body, style: TextStyle(fontSize: 12))),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('27.01.2024, 15:42', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
