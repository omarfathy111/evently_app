import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_size_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/screens/tabs/home/home_tab.dart';
import 'package:evently_app/screens/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          buildBottomNavigationBarItem(
            iconPath: AppAssets.homeIcon,
            label: AppLocalizations.of(context)!.home,
            index: 0,
          ),
          buildBottomNavigationBarItem(
            iconPath: AppAssets.heartIcon,
            label: AppLocalizations.of(context)!.favorite,
            index: 1,
          ),
          buildBottomNavigationBarItem(
            iconPath: AppAssets.userIcon,
            label: AppLocalizations.of(context)!.favorite,
            index: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: AppSizeUtils.getwidth(context) * 0.04,
            vertical: AppSizeUtils.getwidth(context) * 0.04
          ),
          child: IndexedStack(index: selectedIndex, children: tabs),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? ImageIcon(AssetImage(iconPath), color: AppColors.mainLightColor)
          : ImageIcon(AssetImage(iconPath)),
      label: label,
    );
  }
}
