import 'package:countries_app/app/app_assets.dart';
import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/app/theme/theme_provider.dart';
import 'package:countries_app/feature/country/country_screen.dart';
import 'package:countries_app/feature/home/home_view_model.dart';
import 'package:countries_app/model/countries_model.dart';
import 'package:countries_app/utils/utils.dart';
import 'package:countries_app/widgets/country_tile.dart';
import 'package:countries_app/widgets/filter_bottom_sheet.dart';
import 'package:countries_app/widgets/filter_button.dart';
import 'package:countries_app/widgets/language_modal_bottom_sheet.dart';
import 'package:countries_app/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider).getCountries(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = ref.watch(homeViewModelProvider);
    final themeNotifierRead = ref.read(themeProvider.notifier);
    final themeNotifierWatch = ref.watch(themeProvider);

    Map<String, List<Datum>> groupedCountries = {};
    for (Datum country in homeViewModel.searchData ?? []) {
      String firstLetter = country.name![0].toUpperCase();
      groupedCountries.putIfAbsent(firstLetter, () => []);
      groupedCountries[firstLetter]!.add(country);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
                onTap: () => themeNotifierRead.toggleTheme(),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeNotifierWatch
                          ? AppColors.grey500
                          : Colors.white),
                  padding: EdgeInsets.all(3.0),
                  child: SvgPicture.asset(
                    themeNotifierWatch ? AppAssets.moon : AppAssets.light,
                    colorFilter: ColorFilter.mode(
                        themeNotifierWatch ? Colors.white : AppColors.grey900,
                        BlendMode.srcIn),
                  ),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 48.0,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Search Country',
                  hintStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  fillColor: themeNotifierWatch
                      ? AppColors.grey400.withAlpha(25)
                      : AppColors.grey100,
                  filled: true,
                  prefixIcon: Transform.scale(
                      scale: 0.4,
                      child: SvgPicture.asset(
                        AppAssets.search,
                        colorFilter: ColorFilter.mode(
                            themeNotifierWatch
                                ? AppColors.grey200
                                : AppColors.grey500,
                            BlendMode.srcIn),
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  homeViewModel.searchByCountryName(value);
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  width: 70.0,
                  color: themeNotifierWatch ? AppColors.blue : AppColors.grey25,
                  label: Text(
                    'EN',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: themeNotifierWatch
                            ? AppColors.grey300
                            : Colors.black),
                  ),
                  icon: SvgPicture.asset(
                    AppAssets.globe,
                    colorFilter: ColorFilter.mode(
                        themeNotifierWatch ? AppColors.grey25 : Colors.black,
                        BlendMode.srcIn),
                  ),
                  onPressed: () {
                    Utils.showCustomModalBottomSheet(context,
                        child: LanguagesModalBottomSheet());
                  },
                ),
                FilterButton(
                  width: 90.0,
                  color: themeNotifierWatch ? AppColors.blue : AppColors.grey25,
                  onPressed: () {
                    Utils.showCustomModalBottomSheet(context,
                        child: FilterBottomSheet());
                  },
                  label: Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: themeNotifierWatch
                            ? AppColors.grey300
                            : Colors.black),
                  ),
                  icon: SvgPicture.asset(
                    AppAssets.filter,
                    colorFilter: ColorFilter.mode(
                        themeNotifierWatch ? AppColors.grey25 : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            if (homeViewModel.isLoading)
              ...List<Widget>.generate(6, (index) {
                return ListTile(
                  leading: ShimmerScreenLoading(
                    height: 40.0,
                    width: 40.0,
                    radius: 10.0,
                  ),
                  title: ShimmerScreenLoading(height: 10.0, width: 150.0),
                  subtitle: ShimmerScreenLoading(height: 10.0, width: 100.0),
                );
              }),
            Expanded(
                child: ListView.builder(
              itemCount: groupedCountries.keys.length,
              itemBuilder: (context, index) {
                String letter = groupedCountries.keys.elementAt(index);
                List<Datum> countryList = groupedCountries[letter]!;

                return StickyHeader(
                  header: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: Colors.transparent,
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: themeNotifierWatch
                            ? AppColors.grey400
                            : AppColors.grey500,
                      ),
                    ),
                  ),
                  content: Column(
                    children: countryList.map((country) {
                      return CountryTile(
                          flagUrl: country.href?.flag ?? '',
                          country: country.name ?? '--',
                          capital: country.capital ?? '--',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryScreen(
                                          country: country,
                                        )));
                          },
                          themeNotifierWatch: themeNotifierWatch);
                    }).toList(),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
