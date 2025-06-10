import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';

class OnboardWelcomeScreen extends StatelessWidget {
  const OnboardWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.accent,
      appBar: AppBar(backgroundColor: BrandColors.accent,),
      body: Padding(
        padding: EdgeInsets.only(bottom: 36),
        child: Column(
          children: [
            Center(
              child: Text(
                context.tr('wellcome'),
                textAlign: TextAlign.center,
                style: BrandText.headlineLargeWhite,
              ),
            ),
            SizedBox(height: 100,),
            Image.asset('assets/photo/sneaker.png'),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/photo/big_white_line.png'),
                SizedBox(width: 10,),
                Image.asset('assets/photo/small_dark_line.png'),
                SizedBox(width: 10,),
                Image.asset('assets/photo/small_dark_line.png'),

              ],
            ),
            Spacer(),
            CupertinoButton(
              onPressed: ()=>context.push('/onboard/start'),
              color: Colors.white,
              child: Container(
                width: 335,
                child: Center(
                  child: Text(
                    context.tr('start'),
                    style: BrandText.bodySmallBlack,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
