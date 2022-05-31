import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/Buyer/AllReviews.dart';

import '../../Widgets/ReviewCard.dart';

class MyServiceView extends StatelessWidget {
  const MyServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor('#EC0023'),
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  'https://www.buttercup.in/case-studies/wp-content/uploads/2019/02/logo-design-1-768x432.jpg',
                  fit: BoxFit.fill,
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
              const ListTile(
                tileColor: Color.fromARGB(108, 235, 211, 225),
                leading: CircleAvatar(),
                title: Text(
                  'Mohammed Arif',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('02-01-2022'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Creative logo designing",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "I am creative desiger with expertise of three experiance in illustrator, photoshop and canva...  ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              TabBar(
                physics: BouncingScrollPhysics(),
                labelColor: HexColor('ec0023'),
                unselectedLabelColor: HexColor('#bfbdb6'),
                indicatorColor: HexColor('ec0023'),
                onTap: (index) {
                  // Tab index when user select it, it start from zero
                },
                tabs: const [
                  Tab(
                    child: Text(
                      'Basic',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Standard',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Premium',
                    ),
                  ),
                ],
              ),
              Container(
                child: const TabBarView(
                  children: [
                    Basic(),
                    Standard(),
                    Premium(),
                  ],
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Reviews',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => AllTransactions()));
                          },
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AllReviews(),
                              ));
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ReviewCard());
                    })),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('The Basic Package includes copy of logo in png , jpg format'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text('₹ 1000'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text('3 days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text('1 times'),
            ],
          ),
        ),
      ],
    );
  }
}

class Standard extends StatelessWidget {
  const Standard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
            'The Basic Package includes logo in png , jpg, svg in 2 different sizes format'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text('₹ 2000'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text('2 days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text('2 times'),
            ],
          ),
        ),
      ],
    );
  }
}

class Premium extends StatelessWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('The Basic Package includes copy of logo in png , jpg format'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text('₹ 3000'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text('1 days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text('3 times'),
            ],
          ),
        ),
      ],
    );
  }
}
