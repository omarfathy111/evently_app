import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.introductionScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Center(child: Image.asset(AppAssets.eventlyLogoLight, fit: BoxFit.cover)),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AppAssets.logo, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Text('Supervised by Mohamed Nabil',style: AppStyles.medium16MainColor),
            ),
          )
        ],
      ),
    );
  }
}
