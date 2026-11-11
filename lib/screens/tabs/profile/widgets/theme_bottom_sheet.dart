import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
 @override
  Widget build(BuildContext context) {
    var themeProvider =  Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizeUtils.getwidth(context) * 0.04,
        vertical: AppSizeUtils.getheight(context) * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizeUtils.getheight(context) * 0.02,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark 
                ? _buildSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  )
                : _buildUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light  
                ? _buildSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  )
                : _buildUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedThemeItem({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(textName: theme, style: AppStyles.semi14MainLightColor),
        Icon(Icons.check, size: 30, color: AppColors.mainLightColor),
      ],
    );
  }

  Widget _buildUnSelectedThemeItem({required String theme}) {
    return TextWidget(textName: theme, style: AppStyles.semi20Black);
  }
}