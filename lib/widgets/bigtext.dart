import 'package:flutter/cupertino.dart';
import 'package:crud/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  BigText(
      {Key? key,
      this.color = const Color.fromARGB(255, 255, 255, 255),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size == 0 ? Dimensions.font20 : size),
    );
  }
}
