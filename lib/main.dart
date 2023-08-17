import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/config/theme/app_theme.dart';
import 'package:test_app/features/settings/presentation/pages/settings.dart';

import 'core/widgets/bottom_navigation_screen.dart';
import 'features/subjects/presentation/pages/subject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Test App",
          theme: appTheme(),
          home: child,
          initialRoute: '/subject_screen',
          routes: {
            '/bottom_nav_screen': (context) => const BottomNavigationScreen(),
            '/setting_screen': (context) => const SettingScreen(),
            '/subject_screen': (context) => const SubjectScreen(),
          },
          // onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
      // child: const BottomNavigationScreen(),
    );
  }
}
