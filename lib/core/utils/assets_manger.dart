import 'package:flutter/cupertino.dart';
import 'package:test_app/features/subjects/presentation/pages/subject.dart';

import '../../features/settings/presentation/pages/settings.dart';

class AppAssets {
  static List<String> settingScreen = [
    'Personal information',
    'Profile description',
    'Availability',
    'Certificates',
    'Education',
    'Statistics',
    'withdraw',
    'change password',
    'Become a Student',
    'View Profile',
  ];

  static List<Widget> pages = [
    const SettingScreen(),
    const SettingScreen(),
    const SettingScreen(),
    const SettingScreen(),
    const SettingScreen(),
  ];
}
