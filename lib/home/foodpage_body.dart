import 'package:flutter/material.dart';
import 'package:flutterchatapp/utils/colors.dart';
import 'package:flutterchatapp/widget/big_text.dart';
import 'package:flutterchatapp/widget/icon_and_text.dart';
import 'package:flutterchatapp/widget/smalltext.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pcontroller = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scalefactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pcontroller.addListener(() {
      setState(() {
        _currPageValue = pcontroller.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pcontroller,
          itemCount: 5,
          itemBuilder: (context, position) => _buildPageitem(position)),
    );
  }

  Widget _buildPageitem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var _currScale = 1 - (_currPageValue - index) * (1 - _scalefactor);
      var _curTransform = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _curTransform, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var _currScale =
          _scalefactor + (_currPageValue - index + 1) * (1 - _scalefactor);
      var _curTransform = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _curTransform, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var _currScale = 1 - (_currPageValue - index) + (1 - _scalefactor);

      var _curTransform = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _curTransform, 0);
    } else {
      var _currScale = 0.8;
       matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _height*(1-_scalefactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: const Color(0xff69c5df),
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/jordan.JPG"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                    BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                    BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(5, 0),
                  )
                ]
              ),
              child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigText(
                        text: "Jordan Maxio",
                        size: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: MyAppColor.mainColor,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(width: 10),
                          const SmallText(
                            text: "4.5",
                            size: 13,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const SmallText(
                            text: "1242 comments",
                            size: 13,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconAndText(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: MyAppColor.iconcolor1),
                          IconAndText(
                              icon: Icons.location_on,
                              text: "1.7 km",
                              iconColor: MyAppColor.mainColor),
                          IconAndText(
                              icon: Icons.access_time_rounded,
                              text: "32 min",
                              iconColor: MyAppColor.iconcolor2)
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
