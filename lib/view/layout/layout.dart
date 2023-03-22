import 'package:cis_team/view/screens/committees.dart';
import 'package:cis_team/view/screens/events.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../style/colors.dart';
import '../screens/blogs.dart';
import '../screens/home.dart';
import '../screens/videos.dart';
import '../widgets/custom_appbar.dart';
class NavigatorLayout extends StatefulWidget {
  const NavigatorLayout({super.key});

  @override
  State<NavigatorLayout> createState() => _NavigatorLayoutState();
}

class _NavigatorLayoutState extends State<NavigatorLayout> {
  int currentIndex = 0;
  bool isSelected = false;
  List<Widget> screens = [
    const HomeScreen(),
    const EventsScreen(),
    const CommitteesScreen(),
    const BlogsScreen(),
    const VideosScreen(),
  ];
  onItemTapped(index) {
    setState(() {
      currentIndex = index;
      isSelected = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: CustomAppBar(),
      ),
      drawer:Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        unselectedFontSize: 10,
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        selectedFontSize: 12,
        selectedItemColor: AppColors.kGreen,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.kGreen,
        ),
        backgroundColor: AppColors.kBlack,
        currentIndex: currentIndex,
        onTap: (index) {
          onItemTapped(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.users),
            label: "Committees",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.newspaper
            ),
            label: "Blogs",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.youtube,
            ),
            label: "Videos",
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}