import 'package:crud/controller/search_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/top_movies_controller.dart';
import '../utils/dimensions.dart';
import '../widgets/bigtext.dart';
import '../widgets/smalltext.dart';

class SearchResullt extends StatelessWidget {
  SearchResullt({Key? key}) : super(key: key);
  final TopMoviesController topMoviesController = Get.find();
  final SearchMoviesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height10, bottom: Dimensions.height20),
            child: BigText(
              text: "Showing results for: ${Get.arguments["text"]}",
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Obx(() {
            return Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  controller.isLoding.value == false
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searchMovieList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() {
                                Get.toNamed("/moviedetails", arguments: {
                                  "name":
                                      controller.searchMovieList[index].name,
                                  "desc":
                                      controller.searchMovieList[index].desc,
                                  "dlink":
                                      controller.searchMovieList[index].dlink,
                                  "rating":
                                      controller.searchMovieList[index].rating,
                                  "lang":
                                      controller.searchMovieList[index].lang,
                                  "img": controller
                                      .searchMovieList[index].movieImg,
                                  "cat": controller.searchMovieList[index].cat
                                });
                              }),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height20,
                                    left: Dimensions.width20),
                                child: Row(children: [
                                  Container(
                                      width: Dimensions.height45 * 2.2,
                                      height: Dimensions.height45 * 2.2,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius10 * 0.5),
                                        child: Image.network(
                                          controller
                                              .searchMovieList[index].movieImg,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  SizedBox(
                                    width: Dimensions.width35,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: controller
                                              .searchMovieList[index].name,
                                          size: Dimensions.font22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: Dimensions.height10),
                                        SmallText(
                                          text: controller
                                              .searchMovieList[index].desc,
                                          size: Dimensions.font18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          })
                      : Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Dimensions.height150,
                              ),
                              const CircularProgressIndicator(),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              const BigText(text: "Loding....", size: 16, fontWeight: FontWeight.bold,)
                            ],
                          ),
                        )
                ],
              )),
            );
          })
        ],
      ),
    );
  }
}
