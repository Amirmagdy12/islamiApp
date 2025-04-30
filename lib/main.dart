import 'package:flutter/material.dart';
import 'package:islamiapp/ui/HomeScreen/HomeScreen.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/details/sura_details.dart';
import 'package:islamiapp/ui/OnboardingScreen/OnBoardingScreen.dart';
import 'package:islamiapp/utils/app_theme.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName ,
      routes: {
        OnboardingScreen.routeName : (context) => const OnboardingScreen(),
        HomeScreen.routeName : (context) =>  const HomeScreen(),
        SuraDetails.routeName:(context) =>  SuraDetails(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}