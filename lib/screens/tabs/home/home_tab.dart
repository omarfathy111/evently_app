import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(child: Text('Home Tab',style: TextStyle(color: AppColors.blackColor),)),
    );
  }
}