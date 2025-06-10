import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.id,
    required this.category,
  }) : super(key: key);

  String name;
  int price;
  int id;
  int category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.push(
            '/details_shoes',
            extra: {'name': name, 'price': price, 'id': id, 'category': category},
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        height: 182,
        width: 160,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9, right: 9, top: 18),
              child: Container(
                height: 126,
                width: 142,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/photo/nike-zoom.png'),
                    Text(
                      'Best Seller',
                      style: TextStyle(
                        color: Color.fromRGBO(72, 178, 231, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Flexible(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Color.fromRGBO(106, 106, 106, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 34,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 9, bottom: 8),
                        child: Text(
                          '₽$price',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  RootStore().productDetails.addFavorite(name, price, id, category);
                },
                icon: Icon(CupertinoIcons.heart),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.red),
                  iconSize: WidgetStatePropertyAll(20),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  color: Color.fromRGBO(72, 178, 231, 1),
                ),
                child: IconButton(
                  onPressed: () {
                    RootStore().productDetails.addCard(
                      name,
                      price,
                      id,
                      category,
                    );
                    RootStore().productDetails.addPriceCard(price);
                  },
                  icon: Icon(CupertinoIcons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
