import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_use/features/constants.feature.dart';

class ThemeController extends GetxController {
  final _getStore = GetStorage();

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  bool _loadTheme() => _getStore.read(THEME_KEY) ?? false;

  void saveTheme(bool isDarkMode) => _getStore.write(THEME_KEY, isDarkMode);
  void changeTheme(ThemeData theme) => Get.changeTheme(theme);
  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
