import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentIndex = 0;

  void _onIntroEnd(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
  }

  Widget _buildImage(
    String assetName, {
    double width = 372,
    double height = 372,
  }) {
    return Image.asset(assetName, width: width, height: height);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0, color: AppColors.greyColor);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      bodyTextStyle: bodyStyle,

      // pageColor: AppColors.lightBgColor,
      imagePadding: EdgeInsets.all(10),
    );

    return IntroductionScreen(
      key: introKey,

      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Stack(
              children: [
                _buildImage(AppAssets.eventlyPng, height: 27, width: 142),
              ],
            ),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Find Events That Inspire You",
          body: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
          image: _buildImage(AppAssets.hotTrending),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 4,
          ),
        ),
        PageViewModel(
          title: "Effortless Event Planning",
          body: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
          image: _buildImage(AppAssets.beingCreativeLogo),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 4,
          ),
        ),
        PageViewModel(
          title: "Connect with Friends & Share Moments",
          body: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
          image: _buildImage(AppAssets.beingCreativeCommunication),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 4,
          ),
        ),
      ],
      showNextButton: false,
      showDoneButton: false,
      showSkipButton: false,
      showBackButton: false,
      isProgress: false,

      onChange: (index) {
        setState(() {
          currentIndex = index;
        });
      },

      globalFooter: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainLightColor,
              foregroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (currentIndex == 2) {
                _onIntroEnd(context);
              } else {
                introKey.currentState?.next();
              }
            },
            child: Text(currentIndex == 2 ? 'Get Started' : ' Next'),
          ),
        ),
      ),
    );
  }
}
