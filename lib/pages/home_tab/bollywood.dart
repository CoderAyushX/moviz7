import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigtext.dart';
import '../../widgets/home/top_movies.dart';
import 'package:crud/widgets/home/grid_for_movies.dart';

class Bollywood extends StatelessWidget {
  final String text;
  final String text2;
  final dynamic controller;
  const Bollywood(
      {Key? key,
      required this.text,
      required this.text2,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                top: Dimensions.height10,
                bottom: Dimensions.height20),
            child: BigText(
              text: text,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TopMovies(
            topmovies: controller,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                top: Dimensions.height30,
                bottom: Dimensions.height20),
            child: BigText(
              text: text2,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          GridForMovies(
            movies: controller,
          ),
        ],
      ),
    );
  }
}
