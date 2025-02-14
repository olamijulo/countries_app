import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  Map<String, bool> continentSelections = {
    'Africa': false,
    'Antarctica': false,
    'Asia': false,
    'Australia': false,
    'Europe': false,
    'North America': false,
    'South America': false,
  };

  Map<String, bool> gmtSelections = {
    'GMT+1:00': false,
    'GMT+2:00': false,
    'GMT+3:00': false,
    'GMT+4:00': false,
    'GMT+5:00': false,
    'GMT+6:00': false,
    'GMT+7:00': false,
    'GMT-6:00': false,
  };

  @override
  Widget build(BuildContext context) {
    final themeNotifierWatch = ref.watch(themeProvider);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: DraggableScrollableSheet(
          initialChildSize: 0.35, // Start at 50% of screen height
          minChildSize: 0.2, // Minimum height
          maxChildSize: 0.9, // Maximum height
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: AppColors.grey300,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Icon(
                              Icons.close,
                              color: AppColors.grey500,
                              size: 13.0,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        title: Text(
                          'Continent',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                        children: [
                          Column(
                            spacing: 10.0,
                            children: [
                              ...continentSelections.entries.map((entry) {
                                return CheckBoxLabelSelection(
                                  label: entry.key,
                                  value: entry.value,
                                  onChanged: (value) {
                                    setState(() {
                                      continentSelections[entry.key] =
                                          value ?? false;
                                    });
                                  },
                                );
                              }),
                            ],
                          )
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        title: Text(
                          'Time Zone',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                        children: [
                          Column(
                            spacing: 10.0,
                            children: [
                              ...gmtSelections.entries.map((entry) {
                                return CheckBoxLabelSelection(
                                  label: entry.key,
                                  value: entry.value,
                                  onChanged: (value) {
                                    setState(() {
                                      gmtSelections[entry.key] = value ?? false;
                                    });
                                  },
                                );
                              })
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 104.0,
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: themeNotifierWatch
                                                ? AppColors.grey100
                                                : AppColors.grey900),
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                          SizedBox(
                            width: 236.0,
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColors.orange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                child: Text(
                                  'Show Results',
                                  style: TextStyle(
                                      color: AppColors.grey25,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                )),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class CheckBoxLabelSelection extends ConsumerWidget {
  final String label;
  final bool value;
  final Function(bool?)? onChanged;
  const CheckBoxLabelSelection({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifierWatch = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor:
                themeNotifierWatch ? AppColors.grey100 : AppColors.blue100,
            value: value,
            onChanged: onChanged)
      ],
    );
  }
}
