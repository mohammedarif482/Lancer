import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/Controller/Providers.dart';

import 'package:lancer1/View/Widgets/Lancer.dart';

import 'package:provider/provider.dart';

import 'SellerHome.dart';
import 'SellerMessage.dart';
import 'SellerOrder.dart';
import 'SellerProfil.dart';

class SellerMain extends StatelessWidget {
  SellerMain({
    this.name,
    this.phone,
    this.email,
    this.password,
  });
  String? name;
  String? phone;
  String? email;
  String? password;
  int selectedindex = 0;

  List<dynamic> pages = [
    SellerHome(),
    SellerMessage(),
    SellerOrders(),
    SellerProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            currentIndex: index,
            unselectedItemColor: HexColor('#bfbdb6'),
            selectedItemColor: HexColor('#EC0023'),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.homeOutline), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.messageSquareOutline), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.clipboardOutline), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.personOutline), label: ""),
            ],
            onTap: (newindex) {
              index = provider.navchange(newindex, index);
            },
          ),
        );
      },
    );
  }

//   var pages = [
//     UserHome(),
//  const   UserMessage(),
//   const  UserCategory(),
//   const  UserOrders(),
//   const  UserProfile(),
//   ];
}
