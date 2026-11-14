import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/model/category.dart';
import 'package:evently_app/screens/widgets/category_item.dart';
import 'package:flutter/material.dart';

class EventsSection extends StatefulWidget {
  const EventsSection({super.key});

  @override
  State<EventsSection> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  List<Category> getListGetegories = Category.getAllGategories();
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: getListGetegories.length,
      child: TabBar(
        isScrollable: true,
        onTap: (index) {
          selectedIndex = index;
          setState(() {
            
          });
        },
        dividerColor: AppColors.transparentColor,
        indicatorColor: AppColors.transparentColor,
        labelPadding: EdgeInsets.symmetric(
          horizontal: AppSizeUtils.getwidth(context) * 0.02,
        ),
        tabAlignment: TabAlignment.start,
        tabs: getListGetegories.map((category) {
          return CategoryItem(
            isSelected:
                selectedIndex == getListGetegories.indexOf(category),
            category: category,
          );
        }).toList(),
      ),
    );
  }
}
