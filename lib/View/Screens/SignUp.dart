import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/GoogleSignUpApi%20.dart';
import 'package:lancer1/APIs/SignUpAPI.dart';

import 'package:lancer1/View/Screens/OTP.dart';
import 'package:lancer1/View/Screens/SignIn.dart';

import 'package:lancer1/View/Widgets/Lancer.dart';
import 'package:provider/provider.dart';

import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../DioConfig/configDio.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor('15182b'),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                    'Welcome',
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
                    'Find efficient service at your cost.\nAnd find you potential clients for your work.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Name',
                                    ),
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value)) {
                                        return 'Enter correct name';
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
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Phone no',
                                    ),
                                    onChanged: (value) {
                                      phone = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\ -]\s*)?|[0]?)?[789]\d{9}|(\d[ -]?){10}\d$')
                                              .hasMatch(value)) {
                                        return 'Enter a valid number';
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
                                        if (value!.isEmpty ||
                                            !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$")
                                                .hasMatch(value)) {
                                          return 'Atleast 8 characters and minimum one letter and one number';
                                        } else {
                                          return null;
                                        }
                                      }),
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
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.16,
                    ),
                    Container(
                      height: 1.5,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Color.fromARGB(112, 255, 255, 255),
                    ),
                    Text(
                      '  or  ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
                Center(
                    child: IconButton(
                        icon: Image.network(
                          'https://www.transparentpng.com/thumb/google-logo/google-logo-png-icon-free-download-SUF63j.png',
                        ),
                        onPressed: () {
                          googleSignUp(context);
                        })),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.014,
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
                    onConfirmation: () {
                      if (formKey.currentState!.validate()) {
                        // SendOTP(phone);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OTPScreen(
                                phone: phone,
                                email: email,
                                name: name,
                                password: password)));

                        SendOTPApi(
                          context,
                          phone,
                        );
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
                            text: "Already have an account ? ",
                          ),
                          TextSpan(
                              text: "Sign In",
                              style: TextStyle(color: HexColor('EC0023'))),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          )),
    );
  }
}
