import 'package:flutter/material.dart';
import 'package:wether_app/core/utils/styles.dart';

class CustomTileData extends StatelessWidget {
  const CustomTileData({
    super.key,
    required this.index1,
    required this.index2,
    required this.value1,
    required this.value2,
  });
  final String index1, index2, value1, value2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(index1, style: Styles.textStyle24),
            Text(index2, style: Styles.textStyle24),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              value1,
              style: Styles.textStyle20.copyWith(color: Colors.white),
            ),
            Text(
              value2,
              style: Styles.textStyle20.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
