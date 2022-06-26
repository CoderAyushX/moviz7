import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'bigtext.dart';

class AppColoumn extends StatelessWidget {
  final String text;
  final int rating;
  const AppColoumn({Key? key, required this.text, this.rating = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "$rating"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "ratings")
          ],
        ),
      ],
    );
  }
}
