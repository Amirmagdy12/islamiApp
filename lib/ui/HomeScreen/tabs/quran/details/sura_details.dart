import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/details/sura_content.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/quran/quran_resources.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_fonts.dart';

class SuraDetails extends StatefulWidget {
   SuraDetails({super.key});
  static const String routeName ='sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses =[];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if(verses.isEmpty){
    LoadSuraFiles(index);}
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
      title: Text(QuranResources.englishQuranSuras[index],
        style: TextStyle(color:AppColors.PrimaryColor ),),
        iconTheme: IconThemeData(
          color: AppColors.PrimaryColor
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.02),
        child: Stack(
          children: [
            Image.asset(AppAssets.FrameSura,
            width: double.infinity,
           // fit: BoxFit.fitWidth,
          ),
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(QuranResources.arabicQuranSuras[index],
                  style:AppFonts.bold20primary ,),
               SizedBox(height:height*.04 ,),
               Expanded(
                   child: verses.isEmpty?
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.PrimaryColor,
                  ),
                ):
                   ListView.separated(
                       separatorBuilder:(context,index){
                         return SizedBox(height: height*.02,);
                       },
                       itemCount: verses.length,
                     itemBuilder: (context, index) {
                       return SuraContent(
                         content: verses[index],
                         index: index,
                         isSelected: selectedIndex == index,
                         onTap: () {
                           setState(() {
                             selectedIndex = index;
                           });
                         },
                       );
                     },)
               ),
              ],
            ),
          ],
        ),
      ),
    );
  }

   Future<void> LoadSuraFiles(int index) async {
     String filecontent = await rootBundle.loadString('assets/files/${index +1}.txt');
     List<String> SuraLines = filecontent.split('\n');
     verses = SuraLines ;
     setState((){});
  }
}
