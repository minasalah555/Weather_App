import 'package:flutter/material.dart';
import 'package:wether_app/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$errMessage Please Write Correct City',
      style: Styles.textStyle20,
      textAlign: TextAlign.center,
    );
  }
}
