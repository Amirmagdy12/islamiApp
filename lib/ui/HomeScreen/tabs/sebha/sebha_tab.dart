import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_fonts.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _turns = 0;
  int counter =0;
  int phraseIndex=0;
  final List<String> phrases = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "سبحان الله وبحمده"
  ];
  void _rotate() {
    setState(() {
      _turns += 1 / 30;
      counter ++;
    });
  }
  void _incrementCounter() {
    setState(() {
      _turns += 1 / 30;
      counter++;
      if (counter >= 33) {
        counter = 0;
        phraseIndex = (phraseIndex + 1) % phrases.length;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',style: AppFonts.bold28white,),
        SizedBox(height: height*.03,),
        Image.asset(AppAssets.SebhaHead,width: width*.3,height: height*.08,),
        Stack(
          children: [
            AnimatedRotation(
              turns: _turns,
              duration: Duration(milliseconds: 500),
              child: Image.asset(AppAssets.SebhaBody,
                width:width*9 ,
                height: height*.4,),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*.18,),
                  Text('${phrases[phraseIndex]}',style: AppFonts.bold24white,),
                  SizedBox(height: height*.02,),
                  FloatingActionButton(
                    splashColor: AppColors.TransparentColor,
                    onPressed:_incrementCounter,

                    child:Text('$counter',style: AppFonts.bold24black,)
                  ),

                ],
              ),
            )
          ],
        )

      ],
    );
  }
}
