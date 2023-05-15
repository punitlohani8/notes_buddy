import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/src/utils/my_colors.dart';
import 'package:untitled/ui/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToLogin(){
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(context, PageTransition(child: LoginPage(), type: PageTransitionType.leftToRightWithFade, duration: Duration(seconds: 1)));
    });
  }

  @override
  void initState(){
    super.initState();
    navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffe2f6ae),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: height * 0.1,),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Lottie.asset('assets/animations/splash_anim.json',),
                Positioned(
                  top: 1,
                  child: Container(
                    width: 80, height: 80,
                    child: Lottie.asset('assets/animations/splash_anim.json',),
                  ),
                ),
                Positioned(
                  right: -10, top: -30,
                  child: Container(
                    width: 100, height: 100,
                    child: Lottie.asset('assets/animations/splash_anim.json',),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  child: Container(
                    width: 90, height: 90,
                    child: Lottie.asset('assets/animations/splash_anim.json',),
                  ),
                ),
                Positioned(
                  bottom: 10, right: 10,
                  child: Container(
                    width: 70, height: 70,
                    child: Lottie.asset('assets/animations/splash_anim.json',),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.1,),
            Text(' Notes Buddy', style: GoogleFonts.mogra(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: MyColors.fontColor)
            ),),
            SizedBox(height: height * 0.01,),
            Text(' All your notes at \n one place', style: GoogleFonts.chakraPetch(
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.fontColor),
            ), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
