import 'package:flutter/material.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/hadeth/hadeth_tab.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/quran_tab.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/radio/radio_tab.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/sebha/sebha_tab.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/time/time_tab.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});
  static const String routeName ='Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;
 List<String> BackgroundImage =[
   AppAssets.QuranBg,
   AppAssets.HadethBg,
   AppAssets.SebhaBg,
   AppAssets.RadioBg,
   AppAssets.TimeBg,
  ];
 List<Widget> ListTabs =[
   QuranTab(),
   HadethTab(),
   SebhaTab(),
   RadioTab(),
   TimeTab(),
 ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(BackgroundImage[selectedIndex],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: AppColors.TransparentColor,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.PrimaryColor
            ),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.black,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                onTap: (index){
                  selectedIndex =index;
                  setState(() {

                  });
                },
                items:   [
                  BottomNavigationBarItem(
                      icon:
                      BuldItemBottomNavigationBar(Index: 0,
                          imagename:AppAssets.IconQuran),
                        label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: BuldItemBottomNavigationBar(Index: 1,
                          imagename: AppAssets.IconHadeth),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: BuldItemBottomNavigationBar(Index: 2,
                          imagename: AppAssets.IconSebha),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: BuldItemBottomNavigationBar(Index: 3,
                          imagename: AppAssets.IconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: BuldItemBottomNavigationBar(Index: 4,
                          imagename: AppAssets.IconTime),
                      label: 'Time')

                ]),
          ),
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.LogoTop),
              Expanded(child: ListTabs[selectedIndex],),
            ],
          )
        ),

      ],
    );
  }
 Widget BuldItemBottomNavigationBar({required int Index,required String imagename}){
    return selectedIndex ==Index  ?
    Container(
        padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: const Color(0x99202020)
        ),
        child: ImageIcon(AssetImage(imagename))
    ): ImageIcon(AssetImage(imagename));
}
}