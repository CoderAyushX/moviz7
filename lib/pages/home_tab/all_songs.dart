import 'package:crud/controller/songs_controller.dart';
import 'package:crud/controller/popular_today_controller.dart';
import 'package:crud/controller/top_songs_controller.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/play_icon.dart';
import 'package:crud/widgets/home/top_songs.dart';
import 'package:crud/widgets/home/you_may_like.dart';
import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';

class AllSongs extends StatelessWidget {
  AllSongs({Key? key}) : super(key: key);
  final TopSongsController topMoviesController = Get.find();
  final PopularTodayController popularTodayController = Get.find();
  final SongsController moviesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          Obx(
            () => Container(
                margin:  EdgeInsets.symmetric(horizontal: Dimensions.width30/2),
                width: Dimensions.screenWidth ,
                height: Dimensions.height150 * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: AppColors.primary,
                ),
                child: popularTodayController.isLoding.value == false
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                            child: Image.network(
                              popularTodayController
                                  .popularSongsList[0].songImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 20,
                              right: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const BigText(
                                        text: "Popular Today",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10 * 0.5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_border,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: Dimensions.width10,
                                          ),
                                          SmallText(
                                            text: "4.9",
                                            size: Dimensions.font18,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: (() {
                                        Get.toNamed("/songsdetails",
                                            arguments: {
                                              "name": popularTodayController
                                                  .popularSongsList[0].name,
                                              "desc": popularTodayController
                                                  .popularSongsList[0].desc,
                                              "dlink": popularTodayController
                                                  .popularSongsList[0].link,
                                              "rating": popularTodayController
                                                  .popularSongsList[0].rating,
                                              "lang": popularTodayController
                                                  .popularSongsList[0].lang,
                                              "img": popularTodayController
                                                  .popularSongsList[0]
                                                  .songImg,
                                              "cat": popularTodayController
                                                  .popularSongsList[0].cat
                                            });
                                      }),
                                      child: const PlayIcon(boxSize: 40))
                                ],
                              ))
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                top: Dimensions.height30,
                bottom: Dimensions.height30),
            child: const BigText(
              text: "Top Songs",
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TopSongs(
            topsongs: topMoviesController.topSongsList,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                top: Dimensions.height30,
                bottom: Dimensions.height20),
            child: const BigText(
              text: "You may like",
              size: 20,
              fontWeight: FontWeight.w700,
              
            ),
          ),
          YouMayLike(
            songs: moviesController.songsList,
          ),
        ],
      ),
    );
  }
}
