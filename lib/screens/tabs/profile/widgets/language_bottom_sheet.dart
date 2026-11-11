import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

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
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en'
                ? _buildSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  )
                : _buildUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar'
                ? _buildSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  )
                : _buildUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedLanguageItem({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(textName: language, style: AppStyles.semi14MainLightColor),
        Icon(Icons.check, size: 30, color: AppColors.mainLightColor),
      ],
    );
  }

  Widget _buildUnSelectedLanguageItem({required String language}) {
    return TextWidget(textName: language, style: AppStyles.semi20Black);
  }
}
