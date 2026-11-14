import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/event_item.dart';
import 'package:evently_app/screens/widgets/events_section.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Column(
      spacing: AppSizeUtils.getheight(context) * 0.02,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  textName: AppLocalizations.of(context)!.welcome_back,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextWidget(
                  textName: 'Route Academy',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Spacer(),

            IconButton(
              onPressed: () {},
              icon: Icon(
                themeProvider.isDark ? Icons.dark_mode_outlined : Icons.sunny,
                color: Theme.of(context).cardColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppSizeUtils.getwidth(context) * 0.02,
                vertical: AppSizeUtils.getheight(context) * 0.01,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizeUtils.getwidth(context) * 0.02,
                vertical: AppSizeUtils.getheight(context) * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor,
              ),
              child: TextWidget(
                textName: languageProvider.appLanguage.toUpperCase(),
                style: AppStyles.semi14White,
              ),
            ),
          ],
        ),
        EventsSection(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizeUtils.getheight(context) * 0.02);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
