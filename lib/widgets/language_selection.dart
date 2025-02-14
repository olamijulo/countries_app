import 'package:countries_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatefulWidget {
  final String value;
  final String groupValue;
  final Function(String?)? onChanged;
  const LanguageSelection(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.value,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        Radio.adaptive(
            activeColor: AppColors.blue100,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged)
      ],
    );
  }
}