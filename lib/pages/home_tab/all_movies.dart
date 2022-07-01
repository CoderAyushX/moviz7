import 'package:crud/controller/movies_controller.dart';
import 'package:crud/controller/popular_today_controller.dart';
import 'package:crud/controller/top_movies_controller.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/download_icon.dart';
import 'package:crud/widgets/home/top_movies.dart';
import 'package:crud/widgets/home/you_may_like.dart';
import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';

class AllMovies extends StatelessWidget {
  AllMovies({Key? key}) : super(key: key);
  final TopMoviesController topMoviesController = Get.find();
  final PopularTodayController popularTodayController = Get.find();
  final MoviesController moviesController = Get.find();
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
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: Dimensions.screenWidth - Dimensions.width20,
                height: Dimensions.height150 * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: const Color.fromARGB(255, 56, 55, 55),
                ),
                child: popularTodayController.isLoding.value == false
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            child: Image.network(
                              popularTodayController
                                  .popularMoviesList[0].movieImg,
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
                                        Get.toNamed("/moviedetails",
                                            arguments: {
                                              "name": popularTodayController
                                                  .popularMoviesList[0].name,
                                              "desc": popularTodayController
                                                  .popularMoviesList[0].desc,
                                              "dlink": popularTodayController
                                                  .popularMoviesList[0].dlink,
                                              "rating": popularTodayController
                                                  .popularMoviesList[0].rating,
                                              "lang": popularTodayController
                                                  .popularMoviesList[0].lang,
                                              "img": popularTodayController
                                                  .popularMoviesList[0]
                                                  .movieImg,
                                              "cat": popularTodayController
                                                  .popularMoviesList[0].cat
                                            });
                                      }),
                                      child: const DownloadIcon(boxSize: 40))
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
              text: "Top movies",
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TopMovies(
            topmovies: topMoviesController.topMoviesList,
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
            movies: moviesController.moviesList,
          ),
        ],
      ),
    );
  }
}
