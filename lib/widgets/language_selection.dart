import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSelection extends ConsumerStatefulWidget {
  final String value;
  final String groupValue;
  final Function(String?)? onChanged;

  const LanguageSelection(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  ConsumerState<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends ConsumerState<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    final themeNotifierWatch = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.value,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        Radio.adaptive(
            activeColor:
                themeNotifierWatch ? AppColors.grey100 : AppColors.blue100,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged)
      ],
    );
  }
}
