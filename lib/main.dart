import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_theme.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/add_event/add_event.dart';
import 'package:evently_app/screens/auth/login/login_screen.dart';
import 'package:evently_app/screens/auth/register/register_screen.dart';
import 'package:evently_app/screens/home/home_screen.dart';
import 'package:evently_app/screens/onboarding/introduction_screen.dart';
import 'package:evently_app/screens/onboarding/onpoarding_screen.dart';
import 'package:evently_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
   
      ChangeNotifierProvider(create: (contxet) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (contxet) => AppThemeProvider(),),
  ],
      child: const MyApp(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      var languageProvider = Provider.of<AppLanguageProvider>(context);
      var themeProvider =  Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: themeProvider.appTheme,
      darkTheme: AppTheme.darkTheme,
      locale:  Locale(languageProvider.appLanguage),
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      initialRoute: AppRoutes.splashScreen,
      routes: {
       AppRoutes.splashScreen: (context) => SplashScreen(),
        AppRoutes.introductionScreen :(context) => IntroductionScreen(),
       AppRoutes.onBoardingScreen: (context) =>  OnBoardingPage(),  
       AppRoutes.registerRouteName: (context) => RegisterScreen(),
       AppRoutes.loginRouteName: (context) =>  LoginScreen(),  
      AppRoutes.homeRouteName: (context) => HomeScreen(),
      AppRoutes.addEventRouteName : (context) => AddEvent()
      },
    );
  }
}
