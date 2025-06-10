import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductBasketCard extends StatelessWidget {
  ProductBasketCard({
    Key? key,
    required this.name,
    required this.price,
    required this.id,
  }) : super(key: key);

  String name;
  int price;
  int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 104,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 85,
            width: 87,
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 247, 249, 1),
              borderRadius: BorderRadius.circular(16)
            ),
          child: Column(
            children: [
              Image.asset('assets/photo/nike-zoom.png'),
            ],
          ),
          ),
          SizedBox(width: 30,),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                Text(
                  '₽$price',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
