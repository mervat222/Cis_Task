import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../style/colors.dart';
import '../layout/layout.dart';
import '../widgets/custom_textfield.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController commentController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 20),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(MaterialPageRoute(builder: (_) {
                      return NavigatorLayout();
                    }));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              Image.asset('assets/images/board.jpg'),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Board 2023",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/cislogo.png",
                    height: 20,
                    width: 20,
                  ),
                  const Text("Cis Team", style: TextStyle(color: Colors.white)),
                  const Padding(
                    padding: EdgeInsets.only(right: 2, left: 5, top: 5),
                    child: Icon(
                      Icons.circle,
                      size: 4,
                      color: AppColors.kGreen,
                    ),
                  ),
                  const Text(
                    '2022-11-26 03:41:24',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 2, left: 5, top: 5),
                    child: Icon(
                      Icons.circle,
                      size: 4,
                      color: AppColors.kGreen,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.comment,
                    color: AppColors.kGreen,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "0",
                    style: TextStyle(color: AppColors.kGreen),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '''" نَخوضُ الدَربَ مُجَددًا، وَلِتَكُن معَالِمُه أفرادً سَائِرين نَحوكَ دَائِمًا "
بداية جديدة بنوايا طيبة، بنبدأها مع قادة جُدد قرروا يضيفوا و يسيبوا أثر جميل، زي الّي اكتسبوه من ناس كتير قبلهم.#Board_2023#CIS_Team''',
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              Padding(
                padding: const EdgeInsets.only(top:12),
                child: CustomFormField(
                  controller: nameController,
                  hint: "Your Name",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                controller: commentController,
                hint: "Write a comment...",
                maxLength: 255,
                maxLines: 3,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Message is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        nameController.clear();
                        commentController.clear();
                        showToast("Comment Sent Successfully");
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(270, 50),
                    backgroundColor: AppColors.kGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "SEND",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

void showToast(message) {
  Fluttertoast.showToast(
    msg: message,
  );
}
