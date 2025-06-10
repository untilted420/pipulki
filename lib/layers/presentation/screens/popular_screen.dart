import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matule/layers/data/network/api.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class PopularScreen extends StatelessWidget {
  PopularScreen({super.key});

  List<int> array = [0, 1, 2, 4, 5, 6, 7, 8];
  List<Widget> childW = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('popular_shoes')),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [Icon(CupertinoIcons.heart)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: Api().getProductFromPlace(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              childW =
                  snapshot.data!.map((e) {
                    return ProductCard(
                      name: e.name,
                      price: e.price,
                      id: e.id,
                      category: e.category,
                    );
                    
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
            return Center(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 160 / 182,
                crossAxisSpacing: 20,
                children: childW,
              ),
            );
          },
        ),
      ),
    );
  }
}
