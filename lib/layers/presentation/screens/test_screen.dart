import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';
import 'package:matule/layers/data/local/sqfite.dart';
import 'package:matule/layers/data/network/api.dart';
import 'package:matule/layers/domain/entity/test_entity.dart';
import 'package:matule/layers/domain/entity/user_entity.dart';
import 'package:matule/layers/domain/repository/test_repository.dart';
import 'package:matule/layers/domain/use_case/test_repository_provider.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:path/path.dart';

class TestScreen extends StatefulWidget {
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  qwe() async {
    TestEntity user = TestEntity(id: 123, name: 'name', lastname: 'lastname');
    print(0);
    await TestRepositoryProvider().createTestDB();
    print(1);
    await TestRepositoryProvider().createTest(user);
    print(2);
    print(await TestRepositoryProvider().readTest());
    print(3);
  }

  void rebuildFurure() {
    setState(() {});
  }

  final myControllerID = TextEditingController();
  final myControllerName = TextEditingController();
  final myControllerLastName = TextEditingController();
  Map<String, dynamic> body = Map<String, dynamic>();
  Future<List<TestEntity>> testqwe = TestRepositoryProvider().readTest();
  // Future<dynamic> api = jsonDecode(Api().getResponse());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoButton(
              child: Text('qweqwe'),
              onPressed: () async {

              },
            ),
            FutureBuilder(
              future: testqwe,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<TestEntity>> snapshot,
              ) {
                List<Widget>? child;

                if (snapshot.hasData) {
                  List<Widget> widgets =
                      snapshot.data!.map((e) {
                        return Center(
                          child: Text(
                            'id:${e.id}, name:${e.name}, lastname:${e.lastname}',
                          ),
                        );
                      }).toList();
                  child = widgets;
                } else {
                  child = const <Widget>[
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }

                return Container(
                  width: double.maxFinite,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: child,
                  ),
                );
              },
            ),
            Align(alignment: Alignment.bottomCenter, child: Text('add user')),
            TextField(
              keyboardType: TextInputType.number,
              controller: myControllerID,

              onSubmitted: (value) {
                body['id'] = myControllerID.text;
              },
            ),
            TextField(
              controller: myControllerName,
              onSubmitted: (value) {
                body['name'] = myControllerName.text;
              },
            ),
            TextField(
              controller: myControllerLastName,
              onSubmitted: (value) {
                body['lastname'] = myControllerLastName.text;
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.get_app),
              onPressed:
                  () => {
                    print(body),
                    TestRepositoryProvider().createTest(
                      TestEntity.fromJson(body),
                    ),
                  },
            ),
            Align(child: Text('del user(id)')),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                TestRepositoryProvider().deleteTest(int.parse(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
