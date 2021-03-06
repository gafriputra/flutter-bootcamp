import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {

  final int index;
  final int rating;

  RatingItem({this.index = 1, this.rating = 5});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'assets/icon_star.png' : 'assets/icon_star_grey.png',
      width: 20,
    );
  }
}