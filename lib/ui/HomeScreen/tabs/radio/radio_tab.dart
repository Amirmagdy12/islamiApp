import 'package:flutter/material.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/radio/container.dart';
import 'package:islamiapp/utils/app_assets.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_fonts.dart';
class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
       child:  Column(
         children: [
           Row(
             children: [
               SizedBox(width: width*.07,),
               Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   color: AppColors.PrimaryColor,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 height: height*.06,
                 width: width*.4,
                 child: Text('Radio',style: AppFonts.bold20black,),
               ),
               SizedBox(width: width*.03,),
               Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   color: AppColors.BlackColor70,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 height: height*.06,
                 width: width*.4,
                 child: Text('Reciters',style: AppFonts.bold20white,),
               )
             ],
           ),
           SizedBox(height:height *.02,),
           RadioContainer(ShakhName: 'Radio Ibrahim Al-Akdar'),
           SizedBox(height:height *.02,),
           RadioContainer(ShakhName: 'Radio Ibrahim Al-Akdar'),
           SizedBox(height:height *.02,),
           RadioContainer(ShakhName: 'Radio Ibrahim Al-Akdar'),
           SizedBox(height:height *.02,),
           RadioContainer(ShakhName: 'Radio Ibrahim Al-Akdar'),
           SizedBox(height:height *.02,),
         ],
       ),
    );
  }
}
