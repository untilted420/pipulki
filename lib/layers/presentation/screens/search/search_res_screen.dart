import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/data/network/api.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class SearchResScreen extends StatelessWidget {
  SearchResScreen({super.key, required this.name});

  String name;
  Widget childW = Text('');
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
              onTap: () => context.pop(),
              readOnly: true,
              decoration: InputDecoration(
                hintText: name,
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
            ),
            SizedBox(height: 28),

            FutureBuilder(
              future: Api().getProductFromPlace(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Widget> listW = [];
                  snapshot.data!.forEach((e) {
                    if (e.name.toLowerCase().contains(name.toLowerCase())) {
                      listW.insert(
                        0,
                        ProductCard(name: e.name, price: e.price, id: e.id, category: e.category)
                      );
                    }
                  });
                  return childW = Expanded(
                    child: GridView.count(crossAxisCount: 2, children: listW),
                  );
                } else {
                  childW = Center(child: CircularProgressIndicator());
                }
                return childW;
              },
            ),
          ],
        ),
      ),
    );
  }
}
