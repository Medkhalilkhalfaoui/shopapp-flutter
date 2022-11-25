import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((_){
        Get.off(()=>OnboardingScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://play-lh.googleusercontent.com/vBQEUKhetnbbHC3_RxYZyM8-qKK7y-buAW-49HAj-zfU2jWD-UDvYvfk9CGwRy25dw"),

                ),
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(height: 64),
            const Text("ShopX", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
