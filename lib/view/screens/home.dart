import 'package:carousel_slider/carousel_slider.dart';
import 'package:cis_team/view/widgets/posts.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../style/colors.dart';
import '../widgets/custom_imagesilder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body:Container(padding:const EdgeInsets.only(left: 10),
        child: Column(crossAxisAlignment:CrossAxisAlignment.start,
          children:  [
            const Text("Our Events",style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w600)),
            const ImageSlider(),
            SizedBox(
              height:200,
              child:ListView.builder(itemBuilder:(context, index) =>PostsItem(index:index, model:posts[index]),
              itemCount:posts.length,scrollDirection:Axis.horizontal),
            )


          ],
        ),
      ),

    );
  }
}
