import 'package:countries_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String? label;
  final String? text;
  const LabelWidget({
    super.key,
    required this.themeNotifierWatch,
    this.label,
    this.text,
  });

  final bool themeNotifierWatch;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.0,
      children: [
        Text(
          label ?? '--',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color:
                  themeNotifierWatch ? AppColors.grey100 : AppColors.grey900),
        ),
        Text(
          text ?? '--',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color:
                  themeNotifierWatch ? AppColors.grey100 : AppColors.grey900),
        )
      ],
    );
  }
}