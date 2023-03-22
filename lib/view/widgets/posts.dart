import 'package:cis_team/style/colors.dart';
import 'package:cis_team/view/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/model.dart';

class PostsItem extends StatelessWidget {
  int index;
  final CisModel model;

  PostsItem({Key? key, required this.index, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:() {
      Navigator.of(context).push(MaterialPageRoute(builder:(_){
        return  PostsScreen();
      }));
    },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(model.imgUrl,width: 180,fit: BoxFit.fitHeight,height:120,),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                model.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 5,
                    color: AppColors.kGreen,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.comment,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "0",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_outlined,
                      color: AppColors.kGreen,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
