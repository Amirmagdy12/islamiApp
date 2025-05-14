import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/ui/HomeScreen/tabs/hadeth/hadeth_file.dart';
class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: List.generate(50, (index)=>index+1).map((i) {
        return HadethFile(index: i );
      }).toList(),
    );
  }
}
