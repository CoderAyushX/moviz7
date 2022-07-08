import 'package:crud/utils/colors.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.height45,
              ),
              width: Dimensions.screenWidth,
              height: Dimensions.height150 * 2.5,
              child: const Image(
                  image: AssetImage("assets/images/bot.png"),
                  fit: BoxFit.contain),
            ),
            Positioned(
              top: Dimensions.height150 * 3,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30 * 2),
                    topRight: Radius.circular(Dimensions.radius30 * 2),
                  ),
                  color: AppColors.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: BigText(
                        text: "Find Trending \nAnd Popular Songs With Our App",
                        size: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.orange,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    const SmallText(
                      text:
                          "Keep Yourself \nupdated abouts What's trending now!!",
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 15,
              left: 15,
              child: SizedBox(
                height: Dimensions.height45 * 1.5,
                child: ElevatedButton(
                  onPressed: (() async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('initScreen', false);
                    Get.offAndToNamed("/");
                  }),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.orange,
                      textStyle: TextStyle(
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.bold,
                      )),
                  child: Row(
                    children: const [
                      Text(
                        "Explore ",
                      ),
                      Icon(CupertinoIcons.arrow_right)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
