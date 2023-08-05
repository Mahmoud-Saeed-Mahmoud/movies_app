import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color starColor;

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 20.0,
    this.starColor = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final normalizedRate = rating / 2;
    bool isHalf = normalizedRate - normalizedRate.floor() > 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          normalizedRate.floor(),
          (index) => Icon(
            Icons.star_rounded,
            size: starSize,
            color: starColor,
          ),
        ),
        isHalf
            ? Icon(Icons.star_half_rounded, color: starColor, size: starSize)
            : Container(),
      ],
    );
  }
}
