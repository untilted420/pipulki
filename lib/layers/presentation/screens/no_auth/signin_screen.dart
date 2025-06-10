import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});
  bool isOpenEye = true;

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  void changeEye() {
    setState(() {
      widget.isOpenEye = !widget.isOpenEye;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 44,
          bottom: 47,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 78),
                Text(
                  context.tr('hello'),
                  // style: TextStyle(
                  //   fontWeight: FontWeight.w700,
                  //   fontSize: 32,
                  //   color: Color.fromRGBO(43, 43, 43, 1),
                  // ),
                  style: BrandText.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  context.tr('fill_your_details'),
                  // style: TextStyle(
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 16,
                  //   color: Color.fromRGBO(112, 123, 129, 1),
                  // ),
                  style: BrandText.subText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 249, 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'xyz@gmail.com',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  context.tr('password'),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 249, 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    obscureText: widget.isOpenEye,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '********',
                      suffixIcon: GestureDetector(
                        onTap: () => changeEye(),
                        child: Icon(
                          widget.isOpenEye
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),

                
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () => context.push('/signin/reg/forgot'),
                        child: Text(
                          context.tr('recovery_password'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(112, 123, 129, 1),
                          ),
                        ),
                      ),
                    ),
                  

                SizedBox(height: 20),

                CupertinoButton(
                  onPressed: () => context.go('/'),
                  color: Color.fromRGBO(72, 178, 231, 1),
                  child: Text(
                    'Войти',
                    style: TextStyle(color: Color.fromRGBO(247, 247, 249, 1)),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                  context.tr('create_accont'),
                  style: BrandText.subText
                ),
                  onTap: () => context.push('/signin/reg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
