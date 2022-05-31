import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/GoogleSignInApi.dart';
import 'package:lancer1/APIs/SignInAPI.dart';
import 'package:lancer1/View/Screens/Buyer/UserMain.dart';
import 'package:lancer1/View/Widgets/Lancer.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'SignUp.dart';

class SignIn extends StatelessWidget {
  //   SignIn({
  //   Key? key,
  //   required this.googleController,
  // }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    SignInApi Signin = Get.put(SignInApi());

    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor('15182b'),
          body: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 35, left: 30),
                      child: Lancerhead()),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Sign in to Lancer.\n Get started again. ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ButtonTheme(
                      height: 100,
                      minWidth: 100,
                      child: IconButton(
                        icon: Image.network(
                          'https://www.transparentpng.com/thumb/google-logo/google-logo-png-icon-free-download-SUF63j.png',
                          height: 100,
                          width: 100,
                        ),
                        onPressed: () {
                          googleLogin(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16,
                      ),
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: const Color.fromARGB(112, 255, 255, 255),
                      ),
                      const Text(
                        '  or  ',
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Color.fromARGB(112, 255, 255, 255),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'Email',
                                      ),
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Enter a valid email';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'Password',
                                      ),
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      validator: (value) {
                                        // if (value!.isEmpty ||
                                        //     // !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$")
                                        //         .hasMatch(value)) {
                                        //   return 'Atleast 8 characters and minimum one letter and one number';
                                        // }
                                        if (value!.isEmpty) {
                                          return 'please enter password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Center(
                    child: ConfirmationSlider(
                      sliderButtonContent: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: HexColor('15183b'),
                      ),
                      text: 'slide to continue',
                      height: 60,
                      backgroundColor: HexColor('EC0023'),
                      backgroundColorEnd: Colors.white,
                      foregroundColor: Colors.white,
                      onConfirmation: () async {
                        if (formKey.currentState!.validate()) {
                          Signin.signInApi(context, password, email);
                          // SendCredentials();
                        }
                      },
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Don't have an account ? ",
                            ),
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: HexColor('EC0023'))),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
