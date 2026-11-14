import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/model/category.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final Category category;
  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizeUtils.getwidth(context) * 0.04,
        vertical: AppSizeUtils.getheight(context) * 0.01,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? AppColors.transparentColor
              : Theme.of(context).dividerColor,
        ),
        color: isSelected
            ? Theme.of(context).cardColor
            : Theme.of(context).highlightColor,
      ),
      child: Row(
        spacing: AppSizeUtils.getwidth(context) * 0.02,
        children: [
          Icon(
            category.icon,
            color: isSelected
                ? AppColors.whiteColor
                : Theme.of(context).cardColor,
          ),

          TextWidget(
            textName: category.categoryName(languageProvider.appLanguage),
            style: isSelected
                ? AppStyles.medium16White
                : Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
