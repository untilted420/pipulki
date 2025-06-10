import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/core/routing/routing.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 134),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/photo/profile_image.png',
                    width: 96,
                    height: 96,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 23),
          Text(
            'Эмануэль Кверти',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.person, color: Colors.white),
              IconButton(
                onPressed: () {
                  navigationShell.goBranch(3);
                },
                icon: Text(
                  'Профиль',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.bag, color: Colors.white),
              IconButton(
                onPressed: () {
                  context.push('/basket');
                },
                icon: Text(
                  context.tr('cart'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.heart, color: Colors.white),
              IconButton(
                onPressed: () {
                  navigationShell.goBranch(1);
                },
                icon: Text(
                  context.tr('favorite'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.bus, color: Colors.white),
              IconButton(
                onPressed: () {
                  context.push('/basket/checkout');
                },
                icon: Text(
                  context.tr('orders'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.bell, color: Colors.white),
              IconButton(
                onPressed: () {
                  navigationShell.goBranch(2);
                },
                icon: Text(
                  context.tr('notifications'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.gear, color: Colors.white),
              IconButton(
                onPressed: () {
                  print('null');
                },
                icon: Text(
                  context.tr('settings'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0),
              ),
            ),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => {context.go('/signin')},
                icon: Icon(CupertinoIcons.arrow_down_left, color: Colors.white),
              ),
              IconButton(
                onPressed: () async {
                  context.go('/signin');
                },
                icon: Text(
                  context.tr('sign_out'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
