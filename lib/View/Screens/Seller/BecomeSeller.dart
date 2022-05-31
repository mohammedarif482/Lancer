import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/BecomeSellerApi.dart';
import 'package:lancer1/APIs/GVerification.dart';
import 'package:lancer1/Model/BecomeSellerModel.dart';
import 'package:lancer1/View/Screens/OTP.dart';
import 'package:provider/provider.dart';

import '../../../sharedPreference.dart';

class BecomeSeller extends StatefulWidget {
  BecomeSeller({
    Key? key,
  }) : super(key: key);

  @override
  State<BecomeSeller> createState() => _BecomeSellerState();
}

BecomeSellerModel becomeseller = BecomeSellerModel();
String? description;
String? website;
String? stitle;
String? slevel;
String? ctitle;
String? cBy;
String? cyear;

class _BecomeSellerState extends State<BecomeSeller> {
  // BecomeSellerApi becomesellerApi = Get.put(BecomeSellerApi());
  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    // print(widget.accesIdToken);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.epilogue(
                          textStyle: TextStyle(
                            color: HexColor('#15182b'),
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "L",
                              style: TextStyle(color: HexColor('EC0023'))),
                          const TextSpan(
                            text: 'ancer.',
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Become a seller',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme:
                            ColorScheme.light(primary: HexColor('#EC0023'))),
                    child: Consumer(
                        builder: (context, GoogleController controller, _) {
                      return Stepper(
                          onStepContinue: (() {
                            // if (isPhoneVerified && isEmailVerified) {
                            if (currentstep != 3) {
                              setState(() => currentstep++);
                            } else if (currentstep == 3) {
                              String getUserData = SaveId.getUserData();
                              Map userDataMap = jsonDecode(getUserData);

                              print(userDataMap);

                              bool isEmailVerified = userDataMap.containsKey(
                                'isEmailVarified',
                              );
                              bool isPhoneVerified = userDataMap.containsKey(
                                'isPhoneVerified',
                              );

                              if (isPhoneVerified && isEmailVerified) {
                                print('Success');


                                List<Skill> skill = [];
                                List<Certification> certificate = [];

                                var userData = SaveId.getUserData();

                                Map map = jsonDecode(userData);

                                skill.add(
                                  Skill(
                                    title: stitle,
                                    level: slevel!.toLowerCase(),
                                  ),
                                );

                                certificate.add(Certification(
                                    title: ctitle,
                                    certifiedBy: cBy,
                                    year: cyear));

                                BecomeSellerModel becomeseller =
                                    BecomeSellerModel(
                                  description: description,
                                  personalWebsite: website,
                                  certifications: certificate,
                                  skills: skill,
                                );

                                becomeSellerPost(
                                  context,
                                  becomeseller,
                                  map['token'],
                                );

                                //  print(
                                //     '++++++++++++++++++-----------------------------------------------+++++++++++++++++++++');
                                // becomeseller.becomeSellerPost(
                                //     context, description!, website!, s, d);
                                // // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (contevaluext) => SellerMain()),
                                //     (route) => false);

                              } else {
                                // showDialog(
                                //   context: context,
                                //   builder: (context) => CupertinoAlertDialog(
                                //     content:
                                //   ),
                                // );
                              }
                            }
                            // }
                          }),
                          onStepCancel: () {
                            if (currentstep != 0) {
                              setState(() => currentstep--);
                            }
                          },
                          currentStep: currentstep,
                          onStepTapped: (index) {
                            setState(() {
                              currentstep = index;
                            });
                          },
                          steps: [
                            Step(
                                isActive: currentstep >= 0,
                                title: const Text(
                                  'Profile',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                content: ProfileContent()),
                            Step(
                                isActive: currentstep >= 1,
                                title: const Text(
                                  'Skills',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                content: SkillContent()),
                            Step(
                                isActive: currentstep >= 2,
                                title: const Text(
                                  'Certificate',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                content: CertificateContent()),
                            Step(
                              isActive: currentstep >= 3,
                              title: const Text(
                                'Verification',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: VerificationContent(
                                googleController: controller,
                              ),
                            ),
                          ]);
                    }),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

//====================================================================================____________++++++++++++++++++++++++

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Profile description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          child: TextField(
            maxLines: 5,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: "Add Profile description",
              hintStyle: TextStyle(color: HexColor('#bfbdb6')),

              // suffixIconColor: HexColor('#bfbdb6'),
            ),
            onChanged: (value) {
              description = value;
            },
          ),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          // height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 0.9,
        ),
        const Text(
          'Add Personal Website',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: "www.example.com",
              hintStyle: TextStyle(color: HexColor('#bfbdb6')),

              // suffixIconColor: HexColor('#bfbdb6'),
            ),
            onChanged: (value) {
              website = value;
            },
          ),
        ),
      ],
    );
  }
}

class VerificationContent extends StatelessWidget {
  String getUserData = SaveId.getUserData();

  VerificationContent({
    Key? key,
    required this.googleController,
  }) : super(key: key);

  GoogleController googleController;

  @override
  Widget build(BuildContext context) {
    Map userDataMap = jsonDecode(getUserData);

    print(userDataMap);

    bool isEmailVerified = userDataMap.containsKey('isEmailVarified');
    bool isPhoneVerified = userDataMap.containsKey('isPhoneVerified');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phone'),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isPhoneVerified ? Colors.white : HexColor('EC0023'),
                primary: isPhoneVerified ? Colors.grey : HexColor('EC0023'),
                side: BorderSide(
                  color: isPhoneVerified ? Colors.grey : HexColor('EC0023'),
                ),
              ),
              onPressed: isPhoneVerified
                  ? null
                  : () {
                      //
                      //

                      //
                      //
                    },
              child: Text(
                isPhoneVerified ? 'Verified' : 'Verify   ',
                style: TextStyle(
                  color: isPhoneVerified ? Colors.grey : Colors.white,
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Email'),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: HexColor('EC0023'),
                backgroundColor:
                    isEmailVerified ? Colors.white : HexColor('EC0023'),
                side: BorderSide(
                  color: isPhoneVerified ? Colors.grey : HexColor('EC0023'),
                ),
              ),
              onPressed: isEmailVerified
                  ? null
                  : () {
                      googleController.googleLogin(context);
                    },
              child: Text(
                isEmailVerified ? 'Verified' : 'Verify   ',
                style: TextStyle(
                  color: isEmailVerified ? Colors.grey : Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class CertificateContent extends StatefulWidget {
  CertificateContent({Key? key}) : super(key: key);

  @override
  State<CertificateContent> createState() => _CertificateContentState();
}

class _CertificateContentState extends State<CertificateContent> {
  String? value;
  final items = [
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add Your Certificate',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(15, 0, 0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // hintText: "Add your skills ",
                  hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                  // suffixIconColor: HexColor('#bfbdb6'),
                ),
                onChanged: (value) {
                  ctitle = value;
                },
              ),
            ),
            const Text(
              'Certified by',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(15, 0, 0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: HexColor('#bfbdb6')),
                ),
                onChanged: (value) {
                  cBy = value;
                  // fskill.skill = value;
                  // becomeseller.certifications = Certification(title: value);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Year',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton<String>(
                    hint: Text('year'),
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      cyear = value;
                      // flevel = Skill(level: value);
                      setState(() {
                        this.value = value;
                      });
                    })
              ],
            )
          ],
        )
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }
}

class SkillContent extends StatefulWidget {
  SkillContent({Key? key}) : super(key: key);

  @override
  State<SkillContent> createState() => _SkillContentState();
}

class _SkillContentState extends State<SkillContent> {
  String? value;
  final items = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add Your Skills',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(15, 0, 0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // hintText: "Add your skills ",
                  hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                  // suffixIconColor: HexColor('#bfbdb6'),
                ),
                onChanged: (value) {
                  stitle = value;
                  // fskill = Skill(skill: value);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Select your Level',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton<String>(
                    hint: const Text('Level'),
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      slevel = value;
                      // flevel = Skill(level: value);
                      setState(() {
                        this.value = value;
                      });
                    })
              ],
            )
          ],
        )
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }
}
