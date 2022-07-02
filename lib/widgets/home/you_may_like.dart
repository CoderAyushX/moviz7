import 'package:crud/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../bigtext.dart';
import '../smalltext.dart';

class YouMayLike extends StatelessWidget {
  final dynamic songs;
  const YouMayLike({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* obx listview for songs card
    return Obx(() {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:songs.length,
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
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/images/iyu.jpg"),
                        image: NetworkImage(
                         songs[index].songImg,
                        ),
                        height: Dimensions.pageViewContainer,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  width: Dimensions.width35,
                ),
                //? title and desc
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text:songs[index].name,
                        size: Dimensions.font22,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: Dimensions.height10),
                      SmallText(
                        text:songs[index].desc,
                        size: Dimensions.font18,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  //* routings with arguments
                  onTap: (() {
                    Get.toNamed("/songsdetails", arguments: {
                      "name":songs[index].name,
                      "desc":songs[index].desc,
                      "dlink":songs[index].link,
                      "rate":songs[index].rate,
                      "rating":songs[index].rating,
                      "lang":songs[index].lang,
                      "img":songs[index].songImg,
                      "cat":songs[index].cat
                    });
                  }),
                  //* button to navigate
                  child: Container(
                    height: Dimensions.height45,
                    width: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      gradient: LinearGradient(
                        colors: [const Color(0xffffc3b1), AppColors.orange],
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
                  ),
                )
              ]),
            );
          });
    });
  }
}
