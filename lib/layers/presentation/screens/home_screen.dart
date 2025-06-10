import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/brand/brand_colors.dart';
import 'package:matule/core/brand/brand_text.dart';
import 'package:matule/layers/presentation/screens/drawer/drawer_screen.dart';
import 'package:matule/layers/presentation/shared/ui/cards/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       menuScreen: DrawerScreen(), 
//       mainScreen: MainHomeScreen(),
//       menuBackgroundColor: BrandColors.accent,
//     );
//   }
// }

// class MainHomeScreen extends StatelessWidget {
//   const MainHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            Text(context.tr('explore'), style: BrandText.titleLarge),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bag)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      onTap: () => context.push('/search'),
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: context.tr('looking_for_shoes'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      heroTag: null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: BrandColors.accent,
                      child: Icon(CupertinoIcons.settings, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  context.tr('select_category'),
                  style: BrandText.bodySmallBlack,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/all'),
                          child: Text(context.tr('see_all')),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/outdoor'),
                          child: Text('Outdoor'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/tennis'),
                          child: Text('Tennis'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 40,
                      width: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.push('/running'),
                          child: Text('Running'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => context.push('/popular'),
                  child: Text(
                    context.tr('popular_shoes'),
                    style: BrandText.bodySmallBlack,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductCard(name: 'Nike', price: 752, id: 1, category: 1),
                  ProductCard(name: 'Nike', price: 852, id: 1, category: 1),
                ],
              ),
              SizedBox(height: 29),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  context.tr('new_arrivals'),
                  style: BrandText.bodySmallBlack,
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/photo/new_arrivals.png',
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
