import 'package:evently_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class Category {
  int id;
  String nameAr;
  String nameEn;
  String imageLight;
  String imageDark;
  IconData icon;

  Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.imageLight,
    required this.imageDark,
    required this.icon,
  });

  static List<Category> getAllGategories() {
    return  [
      Category(
      id: 0,
      nameAr: 'All',
      nameEn: 'الكل',
      imageLight: '',
      imageDark: '',
      icon: Icons.grid_view_outlined,
    ),
    Category(
      id: 1,
      nameAr: 'نادي الكتاب',
      nameEn: 'book club',
      imageLight: AppAssets.bookClubLight,
      imageDark: AppAssets.bookClubDark,
      icon: Icons.menu_book_rounded,
    ),
    Category(
      id: 2,
      nameAr: 'الرياضة',
      nameEn: 'sport',
      imageLight: AppAssets.imageSportLight,
      imageDark: AppAssets.imageSportDark,
      icon: Icons.directions_bike_outlined,
    ),
    Category(
      id: 3,
      nameAr: 'عيد الملاد',
      nameEn: 'birthday',
      imageLight: AppAssets.birthdayLightColor,
      imageDark: AppAssets.birthdayDarkColor,
      icon: Icons.cake_rounded,
    ),
    ];
  }

  static List<Category> getGategories() => getAllGategories().sublist(1); // بيمسح اول item من اليسته

  String categoryName(String languageCode) => languageCode == "ar" ? nameAr : nameEn;

  String categoryImage(bool isDark) => isDark ? imageDark : imageLight;
  


}
