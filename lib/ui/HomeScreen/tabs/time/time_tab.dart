import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_fonts.dart';
class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.AzkarTime,
          height:height*.33 ,
        width: width*.93,),
        Text('Azkar',style: AppFonts.bold16white,),
        Row(
          children: [
            SizedBox(width: width*.02,),
            Image.asset(AppAssets.AzkarEvening,
            height: height*.25,
            width: width* .48,),
            SizedBox(width: width*.02,),
            Image.asset(AppAssets.Azkarmorning,
              height: height*.25,
              width: width* .48,)
          ],
        )
      ],
    );
  }
}
