
import 'package:flutter/cupertino.dart';
import 'package:crud/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  const BigText(
      {Key? key,
      this.color = const Color.fromRGBO(210, 210, 210, 1),
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
