import 'package:flutter/material.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';
import 'package:rep1/featuers/track/peresintaion/view/home_view.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 1;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    const HomeView(),
    const ExploreViewFea(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      bottomNavigationBar: ResponsiveNavigationBar(
        backgroundBlur: 0,
        backgroundOpacity: .8,
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        backgroundColor: Colors.black,

        // showActiveButtonText: false,col
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
              text: 'Track',
              icon: Icons.track_changes,
              backgroundColor: ColorManager.orangeAppColor),
          NavigationBarButton(
              text: 'Home',
              icon: Icons.home,
              backgroundColor: ColorManager.orangeAppColor),
          NavigationBarButton(
              text: 'Profile',
              icon: Icons.person,
              backgroundColor: ColorManager.orangeAppColor),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
