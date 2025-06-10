import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';

class DetailsShoesScreen extends StatelessWidget {
  DetailsShoesScreen({
    super.key,
    required this.name,
    required this.price,
    required this.id,
    required this.category,
  });

  String name;
  int price;
  int id;
  int category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sneaker Shop')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: BrandText.titleLarge),
            SizedBox(height: 8),
            Text("men's Shoes"),
            SizedBox(height: 8),
            Text('₽${price.toString()}', style: BrandText.titleLarge),
            SizedBox(height: 14),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: SizedBox(
                      width: 240,
                      child: Image.asset(
                        'assets/photo/nike-zoom.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      width: 351,
                      child: Image.asset(
                        'assets/photo/Ellipse 5.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/photo/nike-zoom.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 33),
            Center(
              child: Text(
                'Вставка Max Air 270 обеспечивает \nнепревзойденный комфорт в течение всего \nдня. Изящный дизайн ........',
                style: BrandText.subText,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(context.tr('more'), style: BrandText.accentText),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 90,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            RootStore().productDetails.addFavorite(
                              name,
                              price,
                              id,
                              category,
                            );
                          },
                          icon: Icon(CupertinoIcons.heart),
                        ),
                        CupertinoButton(
                          color: BrandColors.accent,
                          onPressed: () async {
                            RootStore().productDetails.addPriceCard(price);
                            RootStore().productDetails.addCard(
                              name,
                              price,
                              id,
                              category,
                            );
                          },
                          // 2tfd
                          child: SizedBox(
                            width: 265,
                            height: 22,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                context.tr('add_to_cart'),
                                style: BrandText.bodyLargeWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
