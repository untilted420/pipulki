import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matule/layers/data/network/api.dart';
import 'package:matule/layers/domain/entity/api_entity.dart';
import 'package:matule/layers/presentation/shared/ui/cards/notification_card.dart';
import 'package:mobx/mobx.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Widget> childW = [];
  Future<List<dynamic>> getNotification = Api().getPostFromPlace();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: getNotification,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              childW =
                  snapshot.data!.map((e) {
                    return NotificationCard(title: e.title, body: e.body);
                  }).toList();
            } else {
              childW = const <Widget>[
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ];
            }
            return Center(child: SingleChildScrollView(child: Column(children: childW)));
          },
        ),
      ),
    );
  }
}
