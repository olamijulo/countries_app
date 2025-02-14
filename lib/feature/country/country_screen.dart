import 'package:countries_app/app/app_assets.dart';
import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/app/theme/theme_provider.dart';
import 'package:countries_app/feature/country/country_view_model.dart';
import 'package:countries_app/model/countries_model.dart';
import 'package:countries_app/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CountryScreen extends ConsumerStatefulWidget {
  final Datum? country;
  const CountryScreen({super.key, required this.country});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CountryScreenState();
}

class _CountryScreenState extends ConsumerState<CountryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(countryViewModelProvider)
          .getStates(context, state: widget.country?.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final countryViewModelWatch = ref.watch(countryViewModelProvider);
    final themeNotifierWatch = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Transform.scale(
            scale: 0.5,
            child: SvgPicture.asset(
              AppAssets.leftArrow,
              colorFilter: ColorFilter.mode(
                  themeNotifierWatch ? AppColors.grey100 : Colors.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
        title: Text(
          widget.country?.name ?? '',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.country?.href?.flag ?? '',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.flag),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                spacing: 10.0,
                children: [
                  LabelWidget(
                      label: 'Population:',
                      text: widget.country?.population ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Region:',
                      text: widget.country?.continent?.name ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Capital:',
                      text: widget.country?.capital ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Motto:',
                      text: widget.country?.description ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                spacing: 10.0,
                children: [
                  LabelWidget(
                      label: 'Official Language:',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Ethnic Group:',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Religion:',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Government:',
                      themeNotifierWatch: themeNotifierWatch),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                spacing: 10.0,
                children: [
                  LabelWidget(
                      label: 'Independence:',
                      text:
                          widget.country?.independenceDate.toString() == 'null'
                              ? '--'
                              : widget.country?.independenceDate.toString(),
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Area:',
                      text: widget.country?.size ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Currency:',
                      text: widget.country?.currency ?? '--',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'GDP:', themeNotifierWatch: themeNotifierWatch),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                spacing: 10.0,
                children: [
                  LabelWidget(
                      label: 'Time zone:',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Date format:',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Dialing code:',
                      text: '+${widget.country?.phoneCode}',
                      themeNotifierWatch: themeNotifierWatch),
                  LabelWidget(
                      label: 'Driving Side:',
                      themeNotifierWatch: themeNotifierWatch),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              ExpansionTile(
                shape: RoundedRectangleBorder(side: BorderSide.none),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.bottomLeft,
                title: Text(
                  'States',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: themeNotifierWatch
                          ? AppColors.grey100
                          : AppColors.grey900),
                ),
                children: [
                  ...countryViewModelWatch.stateModel?.data?.map((value) {
                        return Text(value.name ?? '--',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                color: themeNotifierWatch
                                    ? AppColors.grey100
                                    : AppColors.grey900));
                      }) ??
                      []
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


