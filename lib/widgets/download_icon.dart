import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadIcon extends StatelessWidget {
  final double boxSize;
  final double iconSize;
  const DownloadIcon({Key? key, required this.boxSize,  this.iconSize =24.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize,
      width: boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boxSize / 2),
        gradient: const LinearGradient(
          colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.arrow_down_to_line_alt,
          color: Colors.white,
          size:iconSize,
        ),
      ),
    );
  }
}
