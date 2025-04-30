import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';

class SuraContent extends StatelessWidget {
  const SuraContent({
    super.key,
    required this.content,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final String content;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.02;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: height),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.PrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.PrimaryColor,
            width: 2,
          ),
        ),
        child: Text(
          '$content (${index + 1})',
          style: isSelected ? AppFonts.bold20black : AppFonts.bold20primary,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
