import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../HomeScreen/HomeScreen.dart';


class OnboardingScreen extends StatefulWidget {
  static const String routeName ='OnboardingScreen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingItem> onboardingitems = [
    OnboardingItem(image: 'assets/images/intro1.png',
        text:  'Welcome to Islami App'),
    OnboardingItem(image:  'assets/images/intro2.png',
        text:     'Welcome to Islami App \n \nWe Are Very Excited To Have You In Our Community '),
    OnboardingItem(image: 'assets/images/intro3.png',
        text: 'Reading the Quran\n\n Read, and your Lord is the Most Generous'),
    OnboardingItem(image: 'assets/images/intro4.png',
        text: 'Bearish\n\n Praise the name of your Lord, the Most High'),
    OnboardingItem(image: 'assets/images/intro5.png',
        text: 'Holy Quran Radio\n\n'
            'You can listen to the Holy Quran Radio through the'
            ' application for free and easily')
    ,
  ];
  void _nextPage() {
    if (_currentIndex < onboardingitems.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
        Image.asset('assets/images/logo_top.png',
        height: height*.3,
        ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingitems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingitems[index].image,
                      height: height*.4,
                      width: width*.8,),
                    SizedBox(height: height*.02),
                    Text(
                      onboardingitems[index].text,
                      style: const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                        color: AppColors.PrimaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex > 0
                    ? ElevatedButton(
                  style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.TransparentColor)),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Back",style: TextStyle(color: AppColors.PrimaryColor),),
                )
                    : SizedBox(width: width*.4),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    onboardingitems.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: _currentIndex == index ? 20 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentIndex == index ? AppColors.PrimaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.TransparentColor)),
                  onPressed: _currentIndex == onboardingitems.length - 1
                      ? () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                      : _nextPage,
                  child: Text(_currentIndex == onboardingitems.length - 1 ? "Start" : "Next",
                    style: TextStyle(color: AppColors.PrimaryColor),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class OnboardingItem {
  final String image;
  final String text;
  OnboardingItem({required this.image, required this.text});
}