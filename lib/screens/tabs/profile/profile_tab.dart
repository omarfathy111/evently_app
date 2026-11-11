import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/tabs/profile/widgets/language_bottom_sheet.dart';
import 'package:evently_app/screens/tabs/profile/widgets/profile_item_widget.dart';
import 'package:evently_app/screens/tabs/profile/widgets/theme_bottom_sheet.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizeUtils.getwidth(context) * 0.04,
      ),
      child: Column(
        spacing: AppSizeUtils.getheight(context) * 0.04,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppAssets.profilePic),
          ),
          TextWidget(
            textName: 'John Safwat',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          TextWidget(
            textName: 'johnsafwat.route@gmail.com',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ProfileItemWidget(
            title: AppLocalizations.of(context)!.dark_mode,
            icon: Switch(value: themeProvider.isDark, onChanged: (value) {
              themeProvider.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
            },
            activeTrackColor: Theme.of(context).primaryColorDark,
            activeThumbColor: AppColors.whiteColor,
            inactiveThumbColor:AppColors.whiteColor ,
            ),
            
          ),
          ProfileItemWidget(
            title: AppLocalizations.of(context)!.language,
            icon: IconButton(
              onPressed: () {
                showLanguageBottomSheet();
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ProfileItemWidget(
            title: AppLocalizations.of(context)!.logout,
              icon: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.redColor,
              ),
            ),
          ), 
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
