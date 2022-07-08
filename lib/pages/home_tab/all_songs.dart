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

class AllSongs extends StatefulWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  final TopSongsController topMoviesController = Get.find();

  final PopularTodayController popularTodayController = Get.find();

  final SongsController moviesController = Get.find();

  PageController pageController = PageController(viewportFraction: 0.92);
  double _currPageValue = 0.0;
  final double _scaleFactor = 0.92;
  final double _height = Dimensions.height150 * 1.5;
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

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
          SizedBox(
            height: Dimensions.height150 * 1.5,
            child: Obx(
              () => PageView.builder(
                  itemCount: popularTodayController.popularSongsList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return carousel(index, popularTodayController);
                  }),
            ),
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

//? crousel widget
  Widget carousel(int index, dynamic popularTodayController) {
    //*maths
    Matrix4 martix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      martix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      martix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + -1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      martix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      martix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: martix,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
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
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      child: Image.network(
                        popularTodayController.popularSongsList[index].songImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      text:
                                          "${popularTodayController.popularSongsList[index].rate}",
                                      size: Dimensions.font18,
                                    )
                                  ],
                                )
                              ],
                            ),
                            GestureDetector(
                                onTap: (() {
                                  Get.toNamed("/songsdetails", arguments: {
                                    "name": popularTodayController
                                        .popularSongsList[index].name,
                                    "desc": popularTodayController
                                        .popularSongsList[index].desc,
                                    "dlink": popularTodayController
                                        .popularSongsList[index].link,
                                    "rating": popularTodayController
                                        .popularSongsList[index].rating,
                                    "lang": popularTodayController
                                        .popularSongsList[index].lang,
                                    "img": popularTodayController
                                        .popularSongsList[index].songImg,
                                    "cat": popularTodayController
                                        .popularSongsList[index].cat
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
    );
  }
}
