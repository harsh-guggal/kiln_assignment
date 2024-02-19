import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guggal_social/provider/dashboard_provider.dart';
import 'package:guggal_social/screens/home/home_screen.dart';
import 'package:guggal_social/screens/home/profile_screen.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final listOfScreens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
      return Scaffold(
        backgroundColor: BrandColors.appBackgroundColor,
        body: listOfScreens[dashboardProvider.dashboardIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: BrandColors.appBackgroundColor,
            unselectedLabelStyle: const TextStyle(
                fontVariations: [FontVariation('wght', 500)], fontSize: 12),
            selectedLabelStyle: const TextStyle(
                fontVariations: [FontVariation('wght', 500)], fontSize: 12),
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              dashboardProvider.setIndex(value);
            },
            currentIndex: dashboardProvider.dashboardIndex,
            selectedItemColor: BrandColors.primaryColor,
            unselectedItemColor: BrandColors.greyColor,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                    fit: BoxFit.contain,
                    color: dashboardProvider.dashboardIndex != 0
                        ? Colors.grey
                        : BrandColors.primaryColor,
                    height: 20,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: HeroIcon(
                    HeroIcons.user,
                    style: dashboardProvider.dashboardIndex == 4
                        ? HeroIconStyle.outline
                        : HeroIconStyle.outline,
                  ),
                  label: "Profile"),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CreateTodoScreen(
            //       isEdit: false,
            //       todo: TodoModel(),
            //     ),
            //   ),
            // );
          },
          backgroundColor: BrandColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
