import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/presentation/main/home/home_page.dart';
import 'package:mvvm/presentation/main/notification_page.dart';
import 'package:mvvm/presentation/main/search_page.dart';
import 'package:mvvm/presentation/main/settings_page.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/resources/values_manager.dart';


//================================================================================================================

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

//================================================================================================================

class _MainViewState extends State<MainView> {

  //================================================================================================================
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const SettingsPage()
  ];

  //================================================================================================================

  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.notification.tr(),
    AppStrings.settings.tr(),
  ];

  //================================================================================================================

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[_currentIndex],
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1),
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: AppStrings.search.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: AppStrings.notification.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: AppStrings.settings.tr()),
          ],
        ),
      ),
    );
  }

  //================================================================================================================

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //================================================================================================================
}
