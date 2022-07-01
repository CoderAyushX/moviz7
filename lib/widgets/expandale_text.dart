import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  //* getting text
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  //* late texts
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  //? claculating height
  double textHeight = Dimensions.screenHeight / 5.63;

  //* running check when first launch
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              color: const Color(0xFF8f837f),
              size: Dimensions.font16,
              height: 1.8,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddenText
                      ? ("$firstHalf..")
                      : ("$firstHalf + $secondHalf"),
                  textOverflow: TextOverflow.visible,
                  size: Dimensions.font16,
                  color: const Color(0xFF8f837f),
                  height: 1.8,
                ),
                InkWell(
                  onTap: (() {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  }),
                  child: Row(
                    children: [
                      const SmallText(
                        text: "Show more",
                        color: Color(0xFF89dad0),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: const Color(0xFF89dad0),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
