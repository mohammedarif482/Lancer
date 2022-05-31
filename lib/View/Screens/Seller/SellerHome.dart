import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/Seller/AllTransactions.dart';
import 'package:lancer1/View/Screens/Seller/MyServices.dart';
import 'package:lancer1/View/Screens/Seller/Wallet.dart';

import '../../../sharedPreference.dart';
import '../../Widgets/OverView.dart';

class SellerHome extends StatelessWidget {
  SellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map user = jsonDecode(SaveId.getUserData());

    String imageUrl = user['image']['url'];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${user['name']}',
                        style: GoogleFonts.titilliumWeb(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(imageUrl.isEmpty
                                  ? 'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'
                                  : imageUrl)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Colors.blueAccent,
                        ),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              StackCard(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'DashBoard',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => MyServices())));
                          // print(user);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(15, 0, 0, 0),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: HexColor('#15182b'),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      child: const Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.design_services,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'My \nServices',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: HexColor('#EC0023'),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const OverviewCard(
                        icon: Icons.checklist_sharp,
                        title: 'Completed\nOrders',
                        number: '45'),
                    const SizedBox(
                      width: 15,
                    ),
                    const OverviewCard(
                        icon: Icons.alarm,
                        title: 'Pending\nOrder',
                        number: '6'),
                    const SizedBox(
                      width: 15,
                    ),
                    const OverviewCard(
                        icon: Icons.date_range,
                        title: 'Earnings of\nmonth',
                        number: '₹ 2500'),
                    const SizedBox(
                      width: 15,
                    ),
                    const OverviewCard(
                        icon: Icons.calendar_today,
                        title: 'Avg Earning of\nyear',
                        number: '₹ 10700'),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => AllTransactions())));
                          },
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: HexColor('#EC0023'),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Requested',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Recieved',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '₹ 2300',
                            ),
                            Text(
                              '02-march-2022',
                            ),
                            Text(
                              '02-march-2022',
                            ),
                          ],
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///=====================================///=============================================///=================================///=================================///
///
class StackCard extends StatelessWidget {
  Map user = jsonDecode(SaveId.getUserData());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
              color: HexColor('#15182b'),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Positioned(
          top: 67,
          child: ClipPath(
            clipper: CustomClipPath1(),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(85, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 1.605,
          child: ClipPath(
            clipper: CustomClipPath2(),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(85, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                  )),

              width: 100,
              //  MediaQuery.of(context).size.width * 0.25,
              height: 60,
              // MediaQuery.of(context).size.height * 0.1,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(127, 21, 23, 43),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const Positioned(
          top: 25,
          left: 20,
          child: Text(
            'Wallet Balance ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          top: 55,
          left: 50,
          child: Text(
            '₹ ${user['wallet']}',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
            top: 35,
            left: 230,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: CircleBorder()),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: HexColor('#18152b'),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Wallet()));
              },
            )

            //
            )
      ],
    );
  }
}

class CustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double w = size.width;
    // double h = size.height;

    // final path0 = Path();

    final path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(
        0, size.height * 0.7485000, 0, size.height * 0.9980000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.9920000);
    path0.quadraticBezierTo(size.width * 0.9487500, size.height * 0.6238800,
        size.width * 0.8575000, size.height * 0.5745000);
    path0.cubicTo(
        size.width * 0.7514125,
        size.height * 0.4651200,
        size.width * 0.3423500,
        size.height * 0.3638800,
        size.width * 0.3081250,
        size.height * 0.2420000);
    path0.cubicTo(
        size.width * 0.2917250,
        size.height * 0.1710000,
        size.width * 0.2418750,
        size.height * 0.0445000,
        size.width * 0.1687500,
        0);
    path0.cubicTo(size.width * 0.0609375, size.height * -0.0375000,
        size.width * 0.1156250, size.height * -0.0105000, 0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double w = size.width;
    // double h = size.height;

    final path0 = Path();

    path0.moveTo(0, size.height * 0.0075000);
    path0.quadraticBezierTo(size.width * 0.7265625, size.height * -0.0080000,
        size.width * 0.9975000, 0);
    path0.lineTo(size.width * 0.9987500, size.height * 0.9980000);
    path0.quadraticBezierTo(size.width * 0.8133625, size.height * 0.9692600,
        size.width * 0.7781250, size.height * 0.8955000);
    path0.cubicTo(
        size.width * 0.6548500,
        size.height * 0.7350000,
        size.width * 0.5903125,
        size.height * 0.5202600,
        size.width * 0.5412500,
        size.height * 0.4635000);
    path0.cubicTo(
        size.width * 0.4507875,
        size.height * 0.3633800,
        size.width * 0.1862500,
        size.height * 0.6018800,
        size.width * 0.1387500,
        size.height * 0.5655000);
    path0.cubicTo(
        size.width * 0.0938250,
        size.height * 0.5261200,
        size.width * -0.0206250,
        size.height * 0.3655000,
        0,
        size.height * 0.0075000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

ValuesCard(BuildContext context, IconData icon, String title, String number) {
  Container(
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color.fromARGB(15, 0, 0, 0),
        blurRadius: 4,
        spreadRadius: 0,
        offset: Offset(0, 2),
      ),
    ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4))),
    child: Column(
      children: [Icon(icon), Text(title), Text(number)],
    ),
  );
}
