import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/widgets/custom_elvated_buttom.dart';
import 'package:evently_app/screens/widgets/custom_text_field.dart';
import 'package:evently_app/screens/widgets/image_widget.dart';
import 'package:evently_app/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
 const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailTextContatroller = TextEditingController();

  var nameTextContatroller = TextEditingController();

  var repasswordTextContatroller = TextEditingController();

  var passwordTextContatroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizeUtils.getwidth(context) * 0.04,
            vertical: AppSizeUtils.getheight(context) * 0.04,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: AppSizeUtils.getheight(context) * 0.04,
                children: [
                  ImageWidget(
                    imagePath: themeProvider.appTheme.isDark
                        ? AppAssets.eventlyLogoDrak
                        : AppAssets.eventlyLogoLight,
                    height: 27,
                    width: 142,
                  ),
                  TextWidget(
                    textName: AppLocalizations.of(context)!.create_your_account,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextField(
                    borderColor: Theme.of(context).highlightColor,
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_name,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.person,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    controller: nameTextContatroller,
                    validator: (text) {
                      if (text!.trim().isEmpty || text == null) {
                        return 'please enter your name';
                      }

                      return null;
                    },
                  ),
                  CustomTextField(
                    borderColor: Theme.of(context).highlightColor,
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_email,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    controller: emailTextContatroller,
                    validator: (text) {
                      if (text!.trim().isEmpty || text == null) {
                        return 'please enter your email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(emailTextContatroller.text);

                      if (!emailValid) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    borderColor: Theme.of(context).highlightColor,
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!
                        .please_enter_password,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    obscureText: true,
                    controller: passwordTextContatroller,
                    validator: (text) {
                       if(text!.trim().isEmpty || text == null){
                          return 'please enter your password';
                      }
                      if(text.length <6){
                        return 'Password should be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    borderColor: Theme.of(context).highlightColor,
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!
                        .please_enter_password,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 25,
                      color: AppColors.lightGreyColor,
                    ),
                    obscureText: true,
                    controller: repasswordTextContatroller,
                    validator: (text) {
                      if(text == null || text.trim().isEmpty){
                        return 'please enter your repassword';
                      }
                      if(text != passwordTextContatroller.text){
                        return 'Re-Password doesnt match Password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        register();
                      },
                      backgroundColor: Theme.of(context).cardColor,
                      child: Text(
                        AppLocalizations.of(context)!.sign_up,
                        style: AppStyles.medium20White,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_account,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo: navigate to register screen
                          Navigator.of(context)
                              .pushNamed(AppRoutes.loginRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: Theme.of(context).cardColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: AppSizeUtils.getwidth(context) * 0.01,
                          endIndent: AppSizeUtils.getwidth(context) * 0.04,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: AppSizeUtils.getwidth(context) * 0.04,
                          endIndent: AppSizeUtils.getwidth(context) * 0.01,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: login with google
                    },
                    verticalPadding: AppSizeUtils.getheight(context) * 0.02,
                    borderColor: Theme.of(context).dividerColor,
                    backgroundColor: themeProvider.isDark
                        ? AppColors.darkInputColor
                        : AppColors.whiteColor,
                    child: Row(
                      spacing: AppSizeUtils.getwidth(context) * 0.04,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.googleLogo),
                        Text(
                          AppLocalizations.of(context)!.login_with_google,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register(){
    if(formKey.currentState!.validate()){

    }
  }
}
