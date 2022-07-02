import 'package:crud/utils/colors.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/play_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridForSongs extends StatefulWidget {
  final dynamic songs;
  const GridForSongs({Key? key, required this.songs}) : super(key: key);

  @override
  State<GridForSongs> createState() => _GridForSongsState();
}

class _GridForSongsState extends State<GridForSongs> {
  @override
  Widget build(BuildContext context) {
    //* container for padding
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //*obx grid builder to make songs card
      child: Obx(() {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: widget.songs.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {
                //? routing with arguments
                Get.toNamed("/songsdetails", arguments: {
                  "name": widget.songs[index].name,
                  "desc": widget.songs[index].desc,
                  "dlink": widget.songs[index].link,
                  "rating": widget.songs[index].rating,
                  "lang": widget.songs[index].lang,
                  "img": widget.songs[index].songImg,
                  "cat": widget.songs[index].cat
                });
              }),
              //? card of songs
              child: Card(
                color: AppColors.primary,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: Dimensions.height45 * 3.6,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 / 2),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 / 2),
                        child: FadeInImage(
                          placeholder:
                              const AssetImage("assets/images/iyu.jpg"),
                          image: NetworkImage(widget.songs[index].songImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20 / 1.2),
                        child: Row(
                          children: [
                            Expanded(
                                child: BigText(
                              text: widget.songs[index].name,
                              fontWeight: FontWeight.w600,
                            )),
                            PlayIcon(
                              boxSize: Dimensions.height20 * 2,
                              iconSize: Dimensions.iconSize24,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
