import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomDateTimeWidget extends StatelessWidget {
  final IconData icon;
  final String eventDateOrTime;
  final String chooseDateOrTime;
  VoidCallback onPressed;
   CustomDateTimeWidget({super.key,required this.icon,required this.chooseDateOrTime,required this.onPressed,required this.eventDateOrTime});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizeUtils.getwidth(context)*0.04,
      children: [
        Icon(icon,color:  Theme.of(context).cardColor,size: 25,),
        TextWidget(textName: eventDateOrTime,style: Theme.of(context).textTheme.headlineMedium,),
        Spacer(),
        TextButton(onPressed: onPressed, child: TextWidget(
          textName: chooseDateOrTime,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            color: Theme.of(context).primaryColor
          ),
          
        ),
        
        )
      ],
    );
  }
}