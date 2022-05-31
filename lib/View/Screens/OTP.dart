import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/SignUpAPI.dart';

import 'package:lancer1/View/Widgets/Lancer.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({
    this.name,
    this.phone,
    this.email,
    this.password,
  });
  String? name;
  String? phone;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('15182b'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  Lancerhead(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  Text('Verify your phone number',
                      style: GoogleFonts.epilogue(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.epilogue(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: HexColor('EC0023'),
                        ),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Verification code is send to\n\n ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: phone,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Pinput(
                  onCompleted: (pin) {
                    ValidateOTPApi(context, name ?? '', password ?? '',
                        email ?? "", phone ?? '', pin);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    SendOTPApi(context, phone ?? '');
                  },
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Didn't recieve OTP ? ",
                        ),
                        TextSpan(
                            text: "Resend",
                            style: TextStyle(color: HexColor('EC0023'))),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ));
  }
}
