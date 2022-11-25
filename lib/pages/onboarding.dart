import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.blue,
        // backgroundProvider: NetworkImage('https://picsum.photos/720/1280'),
        skipCallback: () {
          Get.off(()=>LoginPage());
        },
        finishCallback: () {
          Get.off(()=>LoginPage());
        },
      ),
    );
  }
  final pages = [
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/1.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/2.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: Colors.lightBlueAccent,
        imageAssetPath: 'assets/3.jpg',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),

  ];
}
