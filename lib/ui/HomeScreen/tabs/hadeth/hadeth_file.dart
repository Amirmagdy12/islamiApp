import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_fonts.dart';

import '../../../../model/hadeeth_model.dart';

class HadethFile extends StatefulWidget {
  int index ;
   HadethFile({super.key,  required this.index});

  @override
  State<HadethFile> createState() => _HadethFileState();
}

class _HadethFileState extends State<HadethFile> {
  Hadeeth? hadeeth;
 @override
  void initState() {

    super.initState();

    loadHadethFile(widget.index);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color: AppColors.PrimaryColor
      ),
      child:hadeeth ==null?
              ? Center(
                child: CircularProgressIndicator(color: AppColors.BlackColor),
              )
              : Column(
                children: [
          Text(hadeeth?.title??'',
          style: AppFonts.bold24black,),
          Text(hadeeth?.content??'',
            style: AppFonts.bold16black,)
        ],
      ),
    );
  }

void loadHadethFile (int index) async {
  String fileContent = await rootBundle.loadString(
      'assets/files/hadeth/h$index.txt');
 String title = fileContent.substring(0,fileContent.indexOf('\n'));
 String content = fileContent.substring(fileContent.indexOf('\n')+1);
 Hadeeth(title: title, content: content);
 setState(() {

 });
}
}
