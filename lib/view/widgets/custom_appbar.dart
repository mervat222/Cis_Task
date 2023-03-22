import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../style/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.kGreen,
      ),
      elevation: 0,
      backgroundColor: AppColors.kBlack,
      title: const Text(
        "CIS Team",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color:AppColors.kGreen),
      ),
      centerTitle: true,
    );
  }
}