import 'package:crud/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import '../widgets/app_colum.dart';
import '../widgets/app_icon.dart';
import '../widgets/bigtext.dart';
import '../widgets/expandale_text.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //bg image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Get.arguments["img"]),
              )),
            ),
          ),
          //icons
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() {
                    Get.back();
                  }),
                  child: const AppIcon(
                    icon: Icons.arrow_back,
                    backgrounColor: Color.fromARGB(255, 28, 27, 27),
                    iconColor: Colors.white,
                  ),
                ),
                const AppIcon(
                  icon: CupertinoIcons.heart,
                  backgrounColor: Color.fromARGB(255, 28, 27, 27),
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          //intro of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColoumn(
                    text: Get.arguments["name"],
                    rating: Get.arguments["rating"],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ExpandableTextWidget(text: Get.arguments["desc"]),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottamHeightBar * 0.9,
        padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            left: Dimensions.width30,
            right: Dimensions.width30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius30),
            topLeft: Radius.circular(Dimensions.radius30),
          ),
          color: const Color.fromARGB(255, 28, 27, 27),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                gradient: const LinearGradient(
                  colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Row(
                children: [
                  BigText(
                    text: Get.arguments["lang"],
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  const Icon(
                    Icons.language_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Link(
                uri: Uri.parse(Get.arguments["dlink"]),
                target: LinkTarget.blank,
                builder: (context, followLink) {
                  return GestureDetector(
                    onTap: followLink,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
                        gradient: const LinearGradient(
                          colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: Row(
                        children: [
                          const BigText(
                            text: "Download",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          const Icon(
                            Icons.download,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
