import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  const ProfileItemWidget({super.key,required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).dividerColor,
        width: 2,
      )
      ),
      
      child: ListTile(
        title: Text(title,style: Theme.of(context).textTheme.headlineMedium,),
        trailing: icon,      ),    );
  }
}