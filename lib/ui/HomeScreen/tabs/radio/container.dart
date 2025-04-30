
import 'package:flutter/cupertino.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class RadioContainer extends StatelessWidget {
  String ShakhName ;
   RadioContainer({super.key,required this.ShakhName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(decoration: BoxDecoration(
        color: AppColors.PrimaryColor,
        borderRadius: BorderRadius.circular(20)
    ),
      width: width*.93,
      height:height*.18 ,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.MosqueRadio,
            width: double.infinity,),
          Column(
            children: [
              SizedBox(height: height*.02,),
              Text('$ShakhName',style: AppFonts.bold20black,),
              SizedBox(height: height*.04,),
              Image.asset(AppAssets.SoundPlay)
            ],
          ),
        ],
      ),
    );
  }
}


