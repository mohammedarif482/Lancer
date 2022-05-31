import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/Invite.dart';
import 'package:lancer1/View/Screens/Onboad.dart';
import 'package:lancer1/View/Screens/Seller/MyServices.dart';
import 'package:lancer1/View/Screens/Seller/SellerMain.dart';
import 'package:lancer1/View/Screens/Seller/Wallet.dart';
import 'package:lancer1/sharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Buyer/UserMain.dart';

class SellerProfile extends StatelessWidget {
  Map user = jsonDecode(SaveId.getUserData());

  dynamic balance = 10000;

  @override
  Widget build(BuildContext context) {
    String imageUrl = user['image']['url'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: HexColor('#15182b'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              imageUrl.isEmpty
                                  ? 'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'
                                  : imageUrl,
                            ),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                          color: Colors.blueAccent,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        '${user['name']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      )
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => UserMain()));
                        },
                        child: const Text(
                          'Become a Buyer ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: HexColor('EC0023')),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      'My Lancer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyServices()));
                    },
                    leading: Icon(Icons.favorite_border_rounded),
                    title: Text(
                      'My Services',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  ListTile(
                    leading: Icon(EvaIcons.personOutline),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Wallet()));
                    },
                    leading: Icon(Icons.account_balance_wallet_outlined),
                    title: Text(
                      'My wallet',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      'General',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: (() {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Invite()));
                    }),
                    leading: Icon(EvaIcons.personAddOutline),
                    title: Text(
                      'Invite friends',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  ListTile(
                    leading: Icon(EvaIcons.settingsOutline),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.headphones_outlined),
                    title: Text(
                      'Support',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: HexColor('bfbdb6'),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.remove('email');
                      SaveId.deleteId();
                      SaveId.deleteToken();
                      SaveId.deleteRole();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => OnBoard()));
                    },
                    leading: Icon(
                      EvaIcons.logOutOutline,
                      color: HexColor('ec0023'),
                    ),
                    title: Text(
                      'Sign out',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#bfbdb6')),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
