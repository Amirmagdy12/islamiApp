import 'package:flutter/cupertino.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/quran_resources.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_fonts.dart';

class SuraListWidget extends StatelessWidget {
  int index;
   SuraListWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(children: [
        Stack(
          alignment: Alignment.center,
         children: [
           Image.asset(AppAssets.Vector),
           Text('${index+1}',style: AppFonts.bold16white,),
         ],
        ),
        SizedBox(width: width*.04,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSuras[index],style: AppFonts.bold20white,),
            Text('${QuranResources.AyaNumber[index]} verses',style: AppFonts.bold14white,),
          ],
        ),
       Spacer(),

        Text(QuranResources.arabicQuranSuras[index],style: AppFonts.bold20white,),
      ],
      ),
    );
  }
}
