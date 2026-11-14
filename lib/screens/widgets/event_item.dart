import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDark
                ? AppAssets.birthdayDarkColor
                : AppAssets.birthdayLightColor,
          ),
        ),
      ),
      height: AppSizeUtils.getheight(context) * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
            ),
            child: TextWidget(
              textName: 'Jan 21',
              style: Theme.of(context).textTheme.bodyMedium,
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
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  textName: 'This is a Birthday Party ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(onPressed: (){

                }, icon: Icon(Icons.favorite_border_outlined,size: 25,color: Theme.of(context).primaryColor,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
