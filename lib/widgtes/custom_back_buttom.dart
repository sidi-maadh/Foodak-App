import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/widgtes/custom_secondry_buttom.dart';

class CustomBackButtom extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  const CustomBackButtom({
    super.key,
    required this.height,
    required this.width,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return CustomSecondryButtom(
      height: height,
      width: width,
      onTap: onTap,
      iconData: Platform.isIOS ? Icons.chevron_left : Icons.arrow_back,
    );
  }
}
