import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('cart'))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 425,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr('contact_information')),
                    Row(
                      children: [
                        Icon(Icons.mail_outlined),
                        SizedBox(width: 12),
                        Text(
                          'emmanuel@gmail.com\nEmail',
                          style: BrandText.bodySmallBlack,
                        ),
                        Spacer(),
                        Icon(Icons.edit),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.mail_outlined),
                        SizedBox(width: 12),
                        Text(
                          '+234-811-732-5298\nТелефон',
                          style: BrandText.bodySmallBlack,
                        ),
                        Spacer(),
                        Icon(Icons.edit),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      context.tr('address'),
                      style: BrandText.bodySmallBlack,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => context.push('/map'),
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 101,
                              width: 295,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/photo/map_image.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.33),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 101,
                                width: 295,
                                child: Center(
                                  child: Text(
                                    context.tr('view_map'),
                                    style: BrandText.bodySmallWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(context.tr('payment_method')),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(CupertinoIcons.money_dollar),
                        Column(
                          children: [
                            Text('DbL Card'),
                            Text('**0696 4629', style: BrandText.subText),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                content: Container(
                                  height: 375,
                                  width: 335,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        context.tr('payment_successful'),
                                        style: BrandText.bodyLargBlack,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 30,),
                                      CupertinoButton(
                                        onPressed: (){},
                                        color: BrandColors.accent,
                                        child: Text(
                                          context.tr('back_to_shop'),
                                          style: BrandText.bodySmallWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            );
                          },
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
