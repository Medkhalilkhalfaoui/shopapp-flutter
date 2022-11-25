import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../color.dart';
import '../controllers/auth/auth_controller.dart';
import 'home.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = AuthController();

  _buildtop() {
    return Column(
      children: [
        const Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "create a new account",
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
                                        authController.register(username.text, password.text);
                                        Get.offAll(() => HomeView());
                                        //authController.register(username, password)
                                        Get.snackbar(
                                          "Successfully",
                                          "registred!",
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
                                      } else {
                                        Get.snackbar(
                                          "Invalid ",
                                          "username or password",
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
                                    },
                                    child: const Text("CREATE ACCOUNT")),
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
                            const Text("Already have an account ?"),
                            TextButton(onPressed: (){
                               Get.to(()=>LoginPage());
                            }, child: Text("Login",style: TextStyle(color: kcPrimaryColor),))
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

