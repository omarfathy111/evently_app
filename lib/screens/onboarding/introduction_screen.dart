import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/image_widget.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Column(
        spacing: 27,
        children: [
          ImageWidget(imagePath: AppAssets.eventlyPng, height: 27, width: 142),
          ImageWidget(
            imagePath: AppAssets.beingCreative,
            height: 343,
            width: 343,
          ),
          TextWidget(
            textName: 'Personalize Your Experience',
            style: AppStyles.semi22Black,
          ),
          TextWidget(
            textName: ' Choose your preferred theme and \n language to get started with a \n comfortable, tailored experience that suits\n your style',
            style: AppStyles.regular16GreyColor,
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TextWidget(
                  textName: AppLocalizations.of(context)!.language,
                  style: AppStyles.medium18MainColor,
                ),
                Row(
                  spacing: 12,
                  children: [
                    InkWell(
                      onTap: () {
                        languageProvider.changeLanguage('en');
                      },
                      child: Container(
                        height: 32,
                        width: 83,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: languageProvider.appLanguage == "en" ? AppColors.mainLightColor : AppColors.lightBgColor,
                        ),
                        child: Center(
                          child: TextWidget(
                            textName: AppLocalizations.of(context)!.english,
                            style: AppStyles.medium16Black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        languageProvider.changeLanguage('ar');
                      },
                      child: Container(
                        height: 32,
                        width: 83,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                                                  color: languageProvider.appLanguage == "ar" ? AppColors.mainLightColor : AppColors.lightBgColor,

                        ),
                        child: Center(
                          child: TextWidget(
                            textName: AppLocalizations.of(context)!.arabic,
                            style: AppStyles.medium16Black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  textName: AppLocalizations.of(context)!.theme,
                  style: AppStyles.medium18MainColor,
                ),
                Row(
                  spacing: 12,
                  children: [
                    Container(
                      height: 32,
                      width: 83,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:themeProvider.appTheme == ThemeMode.light  ? AppColors.mainLightColor :AppColors.lightBgColor ,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            themeProvider.changeTheme(ThemeMode.light);
                          },
                          icon: Icon(
                            Icons.wb_sunny_outlined,
                            color:  AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themeProvider.appTheme == ThemeMode.dark  ? AppColors.mainLightColor :AppColors.lightBgColor 
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            themeProvider.changeTheme(ThemeMode.dark);
                          },
                          icon: Icon(Icons.mode_night_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.onBoardingScreen,
              );
            },
            child: Container(
              width: 360,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.mainLightColor,
              ),
              child: Center(
                child: TextWidget(
                  textName: AppLocalizations.of(context)!.lets_start,

                  style: AppStyles.medium20White,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
