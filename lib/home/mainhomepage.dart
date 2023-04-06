// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutterchatapp/home/foodpage_body.dart';
import 'package:flutterchatapp/utils/colors.dart';
import 'package:flutterchatapp/widget/big_text.dart';
import 'package:flutterchatapp/widget/smalltext.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45,bottom: 15),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                    BigText(text: "Ghana",color: MyAppColor.mainColor,),
                     Row(
                       children: [
                         SmallText(text: "Accra",color: Colors.black54,),
                       Icon(Icons.arrow_drop_down)
                       ],
                     )
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    child: Icon(Icons.search,color: Colors.white,),
                    decoration: BoxDecoration(
                        color: MyAppColor.mainColor,
                        borderRadius: BorderRadius.circular(15)),
                  )
                ],
              ),
            ),
          ),
          FoodPageBody()
        ],
      ),
    );
  }
}
