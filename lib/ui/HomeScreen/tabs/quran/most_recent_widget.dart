import 'package:flutter/cupertino.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/quran_resources.dart';
import 'package:islamiapp/utils/shared_prefs_utils.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
 List<int> mostRecentList =[] ;
@override
void initState(){
  super.initState();
  getMostRecentIndicesList();
}
 void getMostRecentIndicesList() async {
  mostRecentList= await readMostRecentList();
  setState(() {

  });
 }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: mostRecentList.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Most Recently',style: AppFonts.bold16white,),
            SizedBox(height: height*.02,),
            SizedBox(
              height: height*.16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mostRecentList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        width: width * .75,
                        height: height * .16,
                        decoration: BoxDecoration(
                          color: AppColors.PrimaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width * .02),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * .01),
                                  Text(
                                    QuranResources.englishQuranSuras[mostRecentList[index]],
                                    style: AppFonts.bold24black,
                                  ),
                                  SizedBox(height: height * .001),
                                  Text(
                                    QuranResources.arabicQuranSuras[mostRecentList[index]],
                                    style: AppFonts.bold24black,
                                  ),
                                  SizedBox(height: height * .001),
                                  Text(
                                    '${QuranResources.AyaNumber[mostRecentList[index]]} verses',
                                    style: AppFonts.bold14black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: width * .08),
                            Image.asset(AppAssets.SuraRecent),
                          ],
                        ),
                      ),
                      SizedBox(width: width * .03),
                    ],
                  );
                },
              ),
            ),

          ],
        ));
  }
}
