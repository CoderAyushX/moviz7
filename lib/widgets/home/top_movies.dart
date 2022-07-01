import 'package:crud/widgets/download_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../bigtext.dart';

class TopMovies extends StatelessWidget {
  final dynamic topmovies;
  const TopMovies({Key? key, required this.topmovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* main container for listview to give padding and height
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width20),
      height: Dimensions.pageViewContainer,
      //? obx list view to build movies card
      child: Obx(() {
        return ListView.builder(
          itemCount: topmovies.length,
          itemBuilder: (context, index) {
            //* movies card
            return Container(
              margin: EdgeInsets.only(right: Dimensions.width30),
              width: Dimensions.pageViewContainer,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      color: const Color.fromARGB(255, 28, 27, 27),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/images/iyu.jpg"),
                        image: NetworkImage(
                          topmovies[index].movieImg,
                        ),
                        height: Dimensions.pageViewContainer,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //? glash effect 
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [Colors.white60, Colors.white30]),
                            border:
                                Border.all(width: 1, color: Colors.white30)),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10,
                            vertical: Dimensions.height10 * .5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BigText(
                                text: topmovies[index].name,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              //* routing
                              onTap: (() {
                                Get.toNamed("/moviedetails", arguments: {
                                  "name": topmovies[index].name,
                                  "desc": topmovies[index].desc,
                                  "dlink": topmovies[index].dlink,
                                  "rating": topmovies[index].rating,
                                  "lang": topmovies[index].lang,
                                  "img": topmovies[index].movieImg,
                                  "cat": topmovies[index].cat
                                });
                              }),
                              child: DownloadIcon(
                                  boxSize: Dimensions.height45,
                                  iconSize: Dimensions.height20),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
          //? to make horizontal scroll
          scrollDirection: Axis.horizontal,
        );
      }),
    );
  }
}
