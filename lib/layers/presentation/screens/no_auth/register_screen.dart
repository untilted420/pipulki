import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  bool personalData = false;
  bool isOpenEye = true;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  changeEye() {
    setState(() {
      widget.isOpenEye = !widget.isOpenEye;
    });
  }

  changPpersonalData() {
    setState(() {
      widget.personalData = !widget.personalData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Padding(
        padding: EdgeInsets.only(top: 121, left: 20, right: 20, bottom: 47),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 335,
              child: Column(
                children: [
                  Text(
                    context.tr('registration'),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    context.tr('fill_your_details'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(112, 123, 129, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.tr('your_name'),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
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
                      labelText: 'xxxxxxxx',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
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
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => changPpersonalData(),
                  child: Icon(
                    widget.personalData
                        ? CupertinoIcons.check_mark_circled_solid
                        : CupertinoIcons.check_mark_circled,
                  ),
                ),
                SizedBox(width: 12),
                Text(context.tr('i_agree')),
              ],
            ),
            SizedBox(height: 24),
            CupertinoButton(
              onPressed: () {
                context.go('/signin');
              },
              color: Color.fromRGBO(72, 178, 231, 1),
              child: SizedBox(
                width: 335,
                child: Text(
                  context.tr('sign_up'),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    context.tr('already_have_account'),
                    style: TextStyle(
                      color: Color.fromRGBO(106, 106, 106, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => context.go('/signin'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
