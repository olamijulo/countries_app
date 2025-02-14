import 'package:countries_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final bool themeNotifierWatch;
  final String country;
  final String capital;
  final String flagUrl;
  final VoidCallback onTap;
  const CountryTile(
      {super.key,
      required this.themeNotifierWatch,
      required this.country,
      required this.capital,
      required this.flagUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          flagUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
        ),
      ),
      title: Text(
        country,
        style: TextStyle(
            color: themeNotifierWatch ? AppColors.grey100 : AppColors.grey900,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        capital,
        style: TextStyle(
            color: themeNotifierWatch ? AppColors.grey400 : AppColors.grey500,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}