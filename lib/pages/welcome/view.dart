import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_chat/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SizedBox(
        width: 360.w,
        height: 780.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index) {
                controller.changPage(index);
              },
              controller: PageController(
                  initialPage: 0, keepPage: false, viewportFraction: 1),
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/banner1.png"))),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/banner2.png"))),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/banner3.png"))),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Positioned(
                        bottom: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.handleSignin();
                          },
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.black),
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              side: WidgetStateProperty.all(
                                  const BorderSide(color: Colors.white))),
                          child: const Text("Login"),
                        ))
                  ]),
                ),
              ],
            ),
            Positioned(
                bottom: 70,
                child: DotsIndicator(
                  position: controller.state.index.value.toInt(),
                  dotsCount: 3,
                  reversed: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
