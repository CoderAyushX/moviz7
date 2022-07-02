import 'package:crud/controller/search_songs_controller.dart';
import 'package:crud/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/top_songs_controller.dart';
import '../utils/dimensions.dart';
import '../widgets/bigtext.dart';
import '../widgets/smalltext.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key}) : super(key: key);
  final TopSongsController topMoviesController = Get.find();
  final SearchSongsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
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
                          itemCount: controller.searchSongsList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() {
                                Get.toNamed("/songsdetails", arguments: {
                                  "name":
                                      controller.searchSongsList[index].name,
                                  "desc":
                                      controller.searchSongsList[index].desc,
                                  "dlink":
                                      controller.searchSongsList[index].link,
                                  "rating":
                                      controller.searchSongsList[index].rating,
                                  "lang":
                                      controller.searchSongsList[index].lang,
                                  "img":
                                      controller.searchSongsList[index].songImg,
                                  "cat": controller.searchSongsList[index].cat
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
                                              .searchSongsList[index].songImg,
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
                                              .searchSongsList[index].name,
                                          size: Dimensions.font22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: Dimensions.height10),
                                        SmallText(
                                          text: controller
                                              .searchSongsList[index].desc,
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
                              const BigText(
                                text: "Loding....",
                                size: 16,
                                fontWeight: FontWeight.bold,
                              )
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
