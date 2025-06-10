import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/layers/data/network/api.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class CategoryRunningScreen extends StatelessWidget {
  CategoryRunningScreen({super.key});

  late List<Widget> childW;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('running'))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  context.tr('select_category'),
                  style: BrandText.bodySmallBlack,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/all'),
                          child: Text(context.tr('see_all')),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/outdoor'),
                          child: Text('Outdoor'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/tennis'),
                          child: Text('Tennis'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: BrandColors.accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/running'),
                          child: Text('Running'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            FutureBuilder(
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
                return Expanded(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      childAspectRatio: 160 / 182,
                      crossAxisSpacing: 20,
                      children: childW,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
