import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_text.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchList = [
    // "New Shoes",
    // "Nike Top Shoes",
    // "Nike Air Force",
    // "Shoes",
    // "Snakers Nike Shoes",
    // "Regular Shoes",
    "velit est quam",
    "autem voluptatem amet iure quae",
    "aut quia expedita non",
    "qui voluptatem consequatur aut ab quis temporibus praesentium",
    "quas perspiciatis optio",
    "est quod aut",
  ];

  List<Widget> listRes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.tr('looking_for_shoes')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                print(value);
                context.push('/search/search_res_screen', extra: value);
              },
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
              ),
              controller: widget.textEditingController,
              onChanged: (value) {
                listRes = [];
                searchList.forEach((e) {
                  if (e.toLowerCase().contains(value.toLowerCase())) {
                    listRes.insert(
                      0,
                      GestureDetector(
                        onTap: () {
                          print(e);
                          widget.textEditingController.value = TextEditingValue(
                            text: e,
                          );
                        },
                        child: ListTile(
                          leading: Icon(CupertinoIcons.clock),
                          title: Text(e),
                        ),
                      ),
                    );
                  }
                });
                setState(() {});
              },
            ),
            Expanded(
              child: SingleChildScrollView(child: Column(children: listRes)),
            ),
          ],
        ),
      ),
    );
  }
}
