import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/layers/presentation/screens/drawer/drawer_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(navigationShell: navigationShell),
      mainScreen: BottomBar(navigationShell: navigationShell),
      menuBackgroundColor: BrandColors.accent,
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(child: navigationShell),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: 128,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/photo/navbar.png',
                    height: 106,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 31,
                    right: 31,
                    bottom: 31.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => navigationShell.goBranch(0),
                                icon: Icon(CupertinoIcons.home, size: 21.5),
                              ),
                              IconButton(
                                onPressed: () => navigationShell.goBranch(1),
                                icon: Icon(CupertinoIcons.heart, size: 21.5),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => navigationShell.goBranch(2),
                                icon: Icon(CupertinoIcons.bell, size: 21.5),
                              ),
                              IconButton(
                                onPressed: () => navigationShell.goBranch(3),
                                icon: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 21.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 44,
                    child: Container(
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        heroTag: null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        backgroundColor: Color.fromRGBO(72, 178, 231, 1),
                        onPressed: () => context.push('/basket'),
                        child: Icon(CupertinoIcons.bag, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
