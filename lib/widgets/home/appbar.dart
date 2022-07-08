
import 'package:crud/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  final List<String> myMenuItems;
  const BaseAppBar(
      {Key? key,
      required this.title,
      required this.appBar,
      required this.myMenuItems})
      : super(key: key);
  //? function to detect which button is clicked
  void onSelect(item) {
    switch (item) {
      case 'Home':
        break;
      case 'Post A Song':
        Get.toNamed("/postasong");
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      automaticallyImplyLeading: false,
      //* actions buttons
      actions: <Widget>[
        // Padding(
        //     padding: EdgeInsets.only(right: Dimensions.width20),
        //     //? notification dot button
        //     child: GestureDetector(
        //       onTap: () {
             
        //       },
        //       child: const Icon(
        //         Icons.refresh_rounded,
        //         size: 26.0,
        //       ),
        //     )),
        //? three dot button
        PopupMenuButton<String>(
            color: AppColors.primary,
            onSelected: onSelect,
            itemBuilder: (BuildContext context) {
              return myMenuItems.map((String choice) {
                //? itmes for popup menu
                return PopupMenuItem<String>(
                  value: choice,
                  child: SizedBox(
                    width: 130.0,
                    child: Text(
                      choice,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              }).toList();
            })
      ],
    );
  }

  //* abstract class overriding
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
