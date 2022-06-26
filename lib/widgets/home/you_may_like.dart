import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/top_movies_controller.dart';
import '../../utils/dimensions.dart';
import '../bigtext.dart';
import '../smalltext.dart';

class YouMayLike extends StatelessWidget {
  var movies;
  YouMayLike({Key? key ,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:movies.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: Dimensions.height20, left: Dimensions.width20),
                child: Row(children: [
                  Container(
                      width: Dimensions.height45 * 2.2,
                      height: Dimensions.height45 * 2.2,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 * 0.5),
                        child: Image.network(
                          movies[index].movieImg,
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(
                    width: Dimensions.width35,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: movies[index].name,
                          size: Dimensions.font22,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: Dimensions.height10),
                        SmallText(
                          text: movies[index].desc,
                          size: Dimensions.font18,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.height45,
                    width: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      gradient: const LinearGradient(
                        colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.right_chevron,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              );
            });
      }),
    );
  }
}
