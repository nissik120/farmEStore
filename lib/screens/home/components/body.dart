import 'package:estore/screens/home/components/categories.dart';
import 'package:estore/screens/home/components/discount_banner.dart';
import 'package:estore/screens/home/components/home_header.dart';
import 'package:estore/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          HomeHeader(),
          SizedBox(height: 10),
          SearchField(),
          SizedBox(height: 15),
          Categories(),
          SizedBox(height: 15),
          DiscountBanner(),
          SizedBox(height: 10),
        ],
      ),
    ),);
  }

}