import 'package:flutter/material.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/most_recent_widget.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/quran_resources.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/details/sura_details.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/sura_list_widget.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_fonts.dart';
import 'package:islamiapp/utils/shared_prefs_utils.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
 List<int> filterIndicesList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (newText){
              FilterListByNewText(newText);
              },
              style: AppFonts.bold20white,
              cursorColor: AppColors.PrimaryColor,
              decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: AppFonts.bold16white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: AppColors.PrimaryColor, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: AppColors.WhiteColor, width: 2.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: AppColors.PrimaryColor, width: 2.0),
                ),
                prefixIcon: const ImageIcon(AssetImage(AppAssets.SuraLogo)),
                prefixIconColor: AppColors.PrimaryColor,
              ),
            ),
          ),
          MostRecentWidget(),
          SizedBox(height: height*.02,),
          Text('Sura List',style: AppFonts.bold16white,),
          SizedBox(height: height*.02,),
          Expanded(child:
          ListView.separated(
            padding: EdgeInsets.zero,
              itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                updateMostRecentIndicesList(filterIndicesList[index]);
                Navigator.of(context).pushNamed(SuraDetails.routeName,
                arguments: filterIndicesList[index]);
              },
              child: SuraListWidget(index: filterIndicesList[index],),
            );
          },
              separatorBuilder:  (context,index){
            return Divider(
              color: AppColors.WhiteColor,
              thickness: 2,
              indent: width*.1,
              endIndent: width*.1,
            );
              },
              itemCount: filterIndicesList.length))

        ],
      ),
    );
  }

  void FilterListByNewText (String newText){
    List<int> filterList=[];
    for(int i=0 ;i < QuranResources.englishQuranSuras.length ;i++){
     if(QuranResources.englishQuranSuras[i].toLowerCase().contains(newText)){
       filterList.add(i);
     }else if (QuranResources.arabicQuranSuras[i].contains(newText)){
       filterList.add(i);
     }
     filterIndicesList =filterList;
     setState(() {});
    }
  }
}
