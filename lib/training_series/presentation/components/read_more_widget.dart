import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  final String text;
  final double? fontSize;

  const ReadMoreWidget({Key? key, required this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 3,
      style: TextStyle(
        fontSize: MediaQuery.sizeOf(context).width * .03,
      ),
      colorClickableText: Theme.of(context).cardColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: '...Show more',
      moreStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.sizeOf(context).width * .035,
      ),
      trimExpandedText: ' show less',
      lessStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.sizeOf(context).width * .035,
      ),
    );
  }
}
