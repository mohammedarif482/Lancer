import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/Seller/AllTransactions.dart';

import '../../Widgets/OverView.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('15182b'),
        title: Text(
          'My Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Personal Balance :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                '₹ 5000',
                style: TextStyle(
                    color: HexColor('EC0023'),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  OverviewCard(
                      icon: Icons.date_range,
                      title: 'Total\nearnings',
                      number: '₹ 45000'),
                  SizedBox(
                    width: 5,
                  ),
                  OverviewCard(
                      icon: Icons.date_range,
                      title: 'Earnings of\nmonth',
                      number: '₹ 2500'),
                  SizedBox(
                    width: 5,
                  ),
                  OverviewCard(
                      icon: Icons.calendar_today,
                      title: 'Avg Earning of\nyear',
                      number: '₹ 10700'),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Withdraw Balance',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: HexColor('ec0023'))),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Download Reports',
                      style: TextStyle(color: HexColor('#bfbdb6')),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white))
              ],
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
                              builder: (context) => AllTransactions()));
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: [
                  Container(
                    color: HexColor('#EC0023'),
                    height: 5,
                    width: double.infinity,
                  ),
                  Container(
                    color: HexColor('#15182b'),
                    height: 15,
                    width: double.infinity,
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
