import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_basket_card.dart';

class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('cart'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    children:
                        RootStore().productDetails.listCard.map((e) {
                          return Column(
                            children: [
                              Dismissible(
                                key: Key(''),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  print(e.id);
                                  RootStore().productDetails.delCard(e.id);
                                },
                                background: Container(
                                  color: Colors.red,
                                  child: Icon(CupertinoIcons.trash),
                                ),
                                child: ProductBasketCard(
                                  name: e.name,
                                  price: e.price,
                                  id: e.id,
                                  
                                ),
                              ),
                              SizedBox(height: 14),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),

            Container(
              height: 258,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 192,
                    width: 335,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              context.tr('subtotal'),
                              style: TextStyle(
                                color: Color.fromRGBO(112, 123, 129, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Observer(
                              builder:
                                  (_) => Text(
                                    '₽${RootStore().productDetails.priceAll.toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              context.tr('delivery'),
                              style: TextStyle(
                                color: Color.fromRGBO(112, 123, 129, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '₽60',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SvgPicture.asset('assets/svg/Vector_line.svg'),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              context.tr('total_cost'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '₽${RootStore().productDetails.priceAll + 60}',
                              style: TextStyle(
                                color: Color.fromRGBO(72, 178, 231, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        CupertinoButton(
                          color: Color.fromRGBO(72, 178, 231, 1),
                          onPressed: () => context.push('/basket/checkout'),
                          child: Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                context.tr('checkout'),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// list.fold(
//     0,
//     (p, c) => p + c,
//   );