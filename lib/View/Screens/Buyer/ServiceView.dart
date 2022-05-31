import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/GetUserInfo.dart';
import 'package:lancer1/View/ChatScreen.dart';
import 'package:lancer1/View/Screens/Buyer/AllReviews.dart';
import 'package:lancer1/sharedPreference.dart';
import 'package:get/instance_manager.dart';

import '../../Widgets/ReviewCard.dart';

class ProductView extends StatelessWidget {
  ProductView({
    this.data,
    this.user,
  });
  Map? data;

  Map? user;
  @override
  Widget build(BuildContext context) {
    // Get.put(GetUSerInfo());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          actions: [
            Icon(Icons.share),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Icon(Icons.favorite_border_rounded),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  data!['images'][0]['url'],
                  fit: BoxFit.fill,
                ),
                height: 200,
                width: 380,
              ),
              ListTile(
                tileColor: Color.fromARGB(108, 235, 211, 225),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user!['image']['url']),
                ),
                title: Text(
                  user!['name'],
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(data!['updatedAt']),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  data!['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  data!['description'],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Builder(builder: (context) {
                int? tabIndex = DefaultTabController.of(context)?.index;
                return TabBar(
                  // isScrollable: false,
                  // physics: BouncingScrollPhysics(),

                  labelColor: HexColor('ec0023'),
                  unselectedLabelColor: HexColor('#bfbdb6'),
                  indicatorColor: HexColor('ec0023'),

                  onTap: (index) {
                    // Tab index when user select it, it start from zero
                    print(index);
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
                );
              }),
              Container(
                child: TabBarView(
                  children: [
                    Basic(
                      data: data,
                    ),
                    Standard(
                      data: data,
                    ),
                    Premium(
                      data: data,
                    ),
                  ],
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     String hello;
              //     hello = SaveId.getToken();
              //     print(hello);
              //   },
              //   child: Text(
              //     "Continue",
              //   ),
              // ),
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
  const Basic({
    Key? key,
    this.data,
    this.user,
  }) : super(key: key);

  final Map? data;

  final Map? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text(data!['packages']['basic']['price'].toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text(data!['packages']['basic']['deliveryTime'].toString() +
                  ' days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text(
                  data!['packages']['basic']['revision'].toString() + ' times'),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: HexColor('#ec0023')),
            onPressed: () async {
              // print(user!['image']['url']);
              Map userInfo = await getUserInfo(data!['user']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ChatScreen(
                      user: userInfo,
                      delivery: data!['packages']['basic']['deliveryTime'],
                      price: data!['packages']['basic']['price'],
                      revision: data!['packages']['basic']['revision'])),
                ),
              );
            },
            child: Text('Continue'))
      ],
    );
  }
}

class Standard extends StatelessWidget {
  const Standard({
    Key? key,
    this.data,
    this.user,
  }) : super(key: key);

  final Map? data;
  final Map? user;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text(data!['packages']['standard']['price'].toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text(data!['packages']['standard']['deliveryTime'].toString() +
                  ' days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text(data!['packages']['standard']['revision'].toString() +
                  ' times'),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: HexColor('#ec0023')),
            onPressed: () async {
              // print(user!['image']['url']);
              Map userInfo = await getUserInfo(data!['user']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ChatScreen(
                      user: userInfo,
                      delivery: data!['packages']['standard']['deliveryTime'],
                      price: data!['packages']['standard']['price'],
                      revision: data!['packages']['standard']['revision'])),
                ),
              );
            },
            child: Text('Continue'))
      ],
    );
  }
}

class Premium extends StatelessWidget {
  const Premium({
    Key? key,
    this.data,
    this.user,
  }) : super(key: key);

  final Map? user;
  final Map? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text(data!['packages']['premium']['price'].toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Time'),
              Text(data!['packages']['premium']['deliveryTime'].toString() +
                  ' days'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Revision '),
              Text(data!['packages']['premium']['deliveryTime'].toString() +
                  ' times'),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: HexColor('#ec0023')),
            onPressed: () async {
              // print(user!['image']['url']);
              Map userInfo = await getUserInfo(data!['user']);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ChatScreen(
                      user: userInfo,
                      delivery: data!['packages']['premium']['deliveryTime'],
                      price: data!['packages']['premium']['price'],
                      revision: data!['packages']['premium']['revision'])),
                ),
              );
            },
            child: Text('Continue'))
      ],
    );
  }
}
