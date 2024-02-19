// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:guggal_social/screens/auth/login_screen.dart';
import 'package:guggal_social/screens/home/home_screen.dart';
import 'package:guggal_social/services/base_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guggal_social/utils/brand_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isLogin = prefs.getBool('isLogin') ?? false;
        if (!isLogin) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const LoginScreen(),
            ),
          );
        } else {
          await BaseService.getSavedAuth();
          await BaseService.refreshAuth(force: true);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const HomeScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(
            'assets/images/logo2.png',
            width: MediaQuery.of(context).size.width / 3,
          ),
        ),
      ),
    );
  }
}
