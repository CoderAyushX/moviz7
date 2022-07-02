import 'package:crud/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  final double boxSize;
  final double iconSize;
  const PlayIcon({Key? key, required this.boxSize, this.iconSize = 24.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize,
      width: boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boxSize / 2),
        gradient: LinearGradient(
          colors: [const Color(0xffffc3b1), AppColors.orange],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.play_circle_fill,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
