import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text(
          context.tr('favorite')
        ),
      ),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 160 / 182,
            crossAxisSpacing: 20,
            children:
                RootStore().productDetails.listFavotite.map((e) {
                  return ProductCard(name: e.name, price: e.price, id: e.id, category: e.category,);
                }).toList(),
          ),
        ),
      ),
    );
  }
}
