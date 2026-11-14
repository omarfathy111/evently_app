import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/custom_text_field.dart';
import 'package:evently_app/screens/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    // var themeProvider = Provider.of<AppThemeProvider>(context);

    return Column(
      spacing: AppSizeUtils.getheight(context)*0.02,
      children: [
        CustomTextField(
          borderColor: AppColors.mainDarkColor,
          hintText: AppLocalizations.of(context)!.search_event,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppSizeUtils.getheight(context) * 0.02,
              );
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
