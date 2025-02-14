import 'package:countries_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final double? width;
  final Color color;
  final VoidCallback? onPressed;
  const FilterButton(
      {super.key,
      required this.label,
      required this.color,
      required this.icon,
      this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: AppColors.grey50))),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 5.0,
              ),
              label
            ],
          )),
    );
  }
}