import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
     return const Center(
      child: Text(AppStrings.settings),
    );
  }
}