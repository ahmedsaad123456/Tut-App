import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/data/data_source/local_data_source.dart';
import 'package:mvvm/presentation/resources/assets_manager.dart';
import 'package:mvvm/presentation/resources/language_manager.dart';
import 'package:mvvm/presentation/resources/routes_manager.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/resources/values_manager.dart';


//================================================================================================================

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

//================================================================================================================

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();


  //================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            leading: SvgPicture.asset(ImageAssets.changeLang),
            title: Text(AppStrings.changeLanguage,
                    style: Theme.of(context).textTheme.displaySmall)
                .tr(),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowSettings)),
            onTap: () {
              _changeLanguage();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.contactUs),
            title: Text(AppStrings.contactUs,
                    style: Theme.of(context).textTheme.displaySmall)
                .tr(),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowSettings)),
            onTap: () {
              _contactUs();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.inviteFriends),
            title: Text(AppStrings.inviteYourFriends,
                    style: Theme.of(context).textTheme.displaySmall)
                .tr(),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowSettings)),
            onTap: () {
              _inviteFriends();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.logout),
            title: Text(AppStrings.logout,
                    style: Theme.of(context).textTheme.displaySmall)
                .tr(),
            trailing: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRtl() ? pi : 0),
                child: SvgPicture.asset(ImageAssets.rightArrowSettings)),
            onTap: () {
              _logout();
            },
          )
        ],
      ),
    );
  }

  //================================================================================================================

  bool isRtl() {
    return context.locale == ARABIC_LOCALE; // app is in arabic language
  }

  //================================================================================================================

  _changeLanguage() {
    _appPreferences.setAppLanguage();
    Phoenix.rebirth(context); // restart the apply language changes
  }

  //================================================================================================================

  _contactUs() {
  }

  //================================================================================================================

  _inviteFriends() {
  }

  //================================================================================================================

  _logout() {
    // app prefs make that user logged out
    _appPreferences.logout();

    // clear cache of logged out user
    _localDataSource.clearCache();

    // navigate to login screen
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  //================================================================================================================
}
