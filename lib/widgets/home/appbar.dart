import 'package:crud/utils/dimensions.dart';
import 'package:flutter/material.dart';

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

  void onSelect(item) {
    switch (item) {
      case 'Home':
        print(Dimensions.height10);
        break;
      case 'Profile':
        print('Profile clicked');
        break;
      case 'Setting':
        print('Setting clicked');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: Dimensions.width20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
                size: 26.0,
              ),
            )),
        PopupMenuButton<String>(
            color: const Color.fromARGB(255, 33, 33, 33),
            onSelected: onSelect,
            itemBuilder: (BuildContext context) {
              return myMenuItems.map((String choice) {
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

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
