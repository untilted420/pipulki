import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';

class OnboardHavePowerScreen extends StatelessWidget {
  const OnboardHavePowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.accent,
      appBar: AppBar(backgroundColor: BrandColors.accent,),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/photo/image_3.png'),
              SizedBox(height: 100,),
              Text(
                context.tr('have_power'),
                style: BrandText.headlineLargeWhite,
              ),
              SizedBox(height: 20,),
              Text(
                context.tr('beautiful_attractive'),
                style: BrandText.bodySmallWhite,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/photo/small_dark_line.png'),
                    SizedBox(width: 10,),
                    Image.asset('assets/photo/small_dark_line.png'),
                    SizedBox(width: 10,),
                    Image.asset('assets/photo/big_white_line.png'),
          
                  ],
                ),
                Spacer(),
                CupertinoButton(
                  onPressed: ()=>context.go('/'),
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
      ),
    );
  }
}
