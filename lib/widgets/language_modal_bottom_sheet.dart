import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/widgets/language_selection.dart';
import 'package:flutter/material.dart';

class LanguagesModalBottomSheet extends StatefulWidget {
  LanguagesModalBottomSheet({
    super.key,
  });

  @override
  State<LanguagesModalBottomSheet> createState() =>
      _LanguagesModalBottomSheetState();
}

class _LanguagesModalBottomSheetState extends State<LanguagesModalBottomSheet> {
  String groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Languages',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
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
          SingleChildScrollView(
            child: Column(
              spacing: 10.0,
              children: [
                LanguageSelection(
                    value: 'Bahasa',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Deutch',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'English',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Espanol',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Francaise',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Italiano',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Portugues',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Pycckuu',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Svenska',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                LanguageSelection(
                    value: 'Turkce',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}


