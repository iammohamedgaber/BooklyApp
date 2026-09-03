import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,  required this.count});
  
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const SizedBox(width: 6.3),
        Text('4.5', style: Styles.textStyle16,overflow: TextOverflow.ellipsis,),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.8,
          child: Text('($count)', style: Styles.textStyle14),
        ),
      ],
    );
  }
}
