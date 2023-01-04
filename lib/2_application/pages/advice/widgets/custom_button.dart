import 'package:flutter/material.dart';
import 'package:performx/2_application/core/constants/color/color_constants.dart';

import '../../../core/theme/text_theme_light.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.onTap, super.key});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: onTap?.call(),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: onTap == null ? ColorConstants.instance.status_red : ColorConstants.instance.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'Get Advice',
              style: TextThemeLight.instance!.signInRemember,
            ),
          ),
        ),
      ),
    );
  }
}
