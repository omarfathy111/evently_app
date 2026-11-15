import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/category.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/category_item.dart';
import 'package:evently_app/screens/widgets/custom_date_time_widget.dart';
import 'package:evently_app/screens/widgets/custom_elvated_buttom.dart';
import 'package:evently_app/screens/widgets/custom_text_field.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  List<Category> cayrgotiesList = Category.getGategories();

  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late AppLanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
     languageProvider = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: AppSizeUtils.getwidth(context) * 0.02,
            vertical: AppSizeUtils.getheight(context) * 0.01,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).highlightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
            ),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: themeProvider.isDark
                  ? AppColors.whiteColor
                  : AppColors.mainLightColor,
            ),
          ),
        ),
        title: TextWidget(
          textName: AppLocalizations.of(context)!.add_event,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizeUtils.getwidth(context) * 0.02,
            vertical: AppSizeUtils.getheight(context) * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizeUtils.getheight(context) * 0.02,
            children: [
              Container(
                height: AppSizeUtils.getheight(context) * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 2),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      cayrgotiesList[selectedIndex].categoryImage(
                        themeProvider.isDark,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeUtils.getheight(context) * 0.08,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: CategoryItem(
                        isSelected: selectedIndex == index,
                        category: cayrgotiesList[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: AppSizeUtils.getwidth(context) * 0.02,
                    );
                  },
                  itemCount: cayrgotiesList.length,
                ),
              ),
              TextWidget(
                textName: AppLocalizations.of(context)!.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomTextField(
                borderColor: Theme.of(context).cardColor,
                hintText: AppLocalizations.of(context)!.event_title,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              TextWidget(
                textName: AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CustomTextField(
                borderColor: Theme.of(context).cardColor,
                hintText: AppLocalizations.of(context)!.event_description,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                maxLines: 3,
              ),
              CustomDateTimeWidget(
                icon: Icons.date_range_outlined,
                eventDateOrTime: AppLocalizations.of(context)!.event_date,

                chooseDateOrTime: selectedDate == null ? AppLocalizations.of(context)!.choose_date : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',

                onPressed: chooseDate,
              ),
              CustomDateTimeWidget(
                icon: Icons.date_range_outlined,
                eventDateOrTime: AppLocalizations.of(context)!.event_time,

                chooseDateOrTime: selectedTime == null ? AppLocalizations.of(context)!.choose_time : selectedTime!.format(context),

                onPressed: chooseTime,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    addEvent();
                  },
                  backgroundColor: Theme.of(context).cardColor,
                  child: Text(
                    AppLocalizations.of(context)!.add_event,
                    style: AppStyles.medium20White,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {}

  void chooseDate() async{
    var chooseDate = await
    showDatePicker(
      context: context,
      locale: Locale(languageProvider.appLanguage),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if(chooseDate !=null){
      selectedDate = chooseDate;
       
    }
     setState(() {
      
    });
  
  }

  void chooseTime() async{
    var chooseTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if(chooseTime !=null){
selectedTime = chooseTime;
    }
    setState(() {
      
    });
  }

}
