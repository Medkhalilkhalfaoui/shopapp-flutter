import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/signup.dart';

import '../color.dart';
import '../controllers/auth/auth_controller.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = AuthController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _buildtop() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          maxRadius: 40,
          child: Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Welcome",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Sign to continue",
          style: TextStyle(color: Colors.grey[400]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            _buildtop(),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                        child: TextFormField(
                      validator: (t) {
                        if (t!.isEmpty) {
                          return "please enter your username. ";
                        }
                        return null;
                      },
                          controller: username,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Username",
                          labelText: "Username"),
                    )),
                    const SizedBox(
                      height: 4,
                    ),
                    Card(
                        child: TextFormField(
                      validator: (t) {
                        if (t!.isEmpty) {
                          return "please enter your password. ";
                        }
                        return null;
                      },
                          controller: password,
                      cursorColor: Colors.black,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Password",
                          labelText: "Password"),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      TextButton(onPressed: (){}, child: Text("Forget password ?",style: TextStyle(color: kcPrimaryColor),))
                    ],),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsetsDirectional.all(18),
                                    primary: kcPrimaryColor),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    var res = authController.login(username.text, password.text);
                                    if(res){
                                      Get.offAll(() => HomeView());
                                      Get.snackbar(
                                        "Successfully",
                                        "logged in",
                                        icon:const Icon(Icons.check, color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        margin:const  EdgeInsets.all(15),
                                        borderRadius: 20,
                                        duration:const Duration(seconds: 2),
                                        isDismissible: true,
                                        dismissDirection: DismissDirection.horizontal,
                                        forwardAnimationCurve: Curves.easeOutBack,
                                        colorText: Colors.white,
                                      );
                                    }else {
                                      Get.snackbar(
                                        "Invalid ",
                                        "credentals",
                                        icon:const Icon(Icons.sms_failed_outlined, color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        margin:const  EdgeInsets.all(15),
                                        borderRadius: 20,
                                        duration:const Duration(seconds: 2),
                                        isDismissible: true,
                                        dismissDirection: DismissDirection.horizontal,
                                        forwardAnimationCurve: Curves.easeOutBack,
                                        colorText: Colors.white,
                                      );
                                    }

                                  } else {
                                    Get.snackbar(
                                      "Invalid ",
                                      "username or password",
                                      icon:const Icon(Icons.sms_failed_outlined, color: Colors.white),
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      margin:const  EdgeInsets.all(15),
                                      borderRadius: 20,
                                      duration:const Duration(seconds: 4),
                                      isDismissible: true,
                                      dismissDirection: DismissDirection.horizontal,
                                      forwardAnimationCurve: Curves.easeOutBack,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                                child: const Text("LOGIN")),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(onPressed: (){
                          Get.off(()=>SignupPage());
                        }, child: Text("Create a new account",style: TextStyle(color: kcPrimaryColor),))
                      ],),
                  ],
                ),
              ),
            )
        ],
      ),
          )),
    );
  }
}
