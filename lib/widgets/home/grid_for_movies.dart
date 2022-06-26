import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/download_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridForMovies extends StatefulWidget {
  final dynamic movies;
  const GridForMovies({Key? key, required this.movies}) : super(key: key);

  @override
  State<GridForMovies> createState() => _GridForMoviesState();
}

class _GridForMoviesState extends State<GridForMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (() {
              Get.toNamed("/moviedetails", arguments: {
                "name": widget.movies[index].name,
                "desc": widget.movies[index].desc,
                "dlink": widget.movies[index].dlink,
                "rating": widget.movies[index].rating,
                "lang": widget.movies[index].lang,
                "img": widget.movies[index].movieImg,
                "cat": widget.movies[index].cat
              });
            }),
            child: Card(
              color: const Color.fromARGB(255, 28, 27, 27),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: Dimensions.height45 * 3.5,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius10 / 2),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius10 / 2),
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/images/iyu.jpg"),
                        image: NetworkImage(widget.movies[index].movieImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height15 / 2,
                        horizontal: Dimensions.width20 / 1.2),
                    child: Row(
                      children: [
                        Expanded(
                            child: BigText(
                          text: widget.movies[index].name,
                          fontWeight: FontWeight.w600,
                        )),
                        DownloadIcon(
                          boxSize: Dimensions.height20 * 2,
                          iconSize: Dimensions.iconSize24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
