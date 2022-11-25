import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/splash.dart';

import 'controllers/auth/auth_controller.dart';

AuthController authController = AuthController();
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  Obx((){
        if(authController.authenicated.value){
          return HomeView();
        }else{
          return SplashScreen();
        }

      }),
    );
  }
}

