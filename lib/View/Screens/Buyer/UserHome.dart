import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/CategoryApi.dart';
import 'package:lancer1/APIs/GetUserInfo.dart';
import 'package:lancer1/APIs/ProductApi.dart';
import 'package:lancer1/APIs/ServicesApi.dart';
import 'package:lancer1/APIs/SignInAPI.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/categoryModel.dart';
import 'package:lancer1/View/Screens/Buyer/ServiceList.dart';

import 'package:lancer1/View/Screens/Buyer/ServiceView.dart';
import 'package:lancer1/View/Screens/Invite.dart';
import 'package:lancer1/View/Widgets/Search.dart';
import 'package:shimmer/shimmer.dart';

import '../../../sharedPreference.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    Get.put(FetchCategory());

    // Get.put(FetchServices());

    return Scaffold(
        backgroundColor: Color.fromARGB(15, 255, 255, 255),
        appBar: AppBar(
          shadowColor: Color.fromARGB(15, 0, 0, 0),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: RichText(
            text: TextSpan(
              style: GoogleFonts.epilogue(
                textStyle: TextStyle(
                    color: HexColor('#15182b'),
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "L", style: TextStyle(color: HexColor('EC0023'))),
                const TextSpan(
                  text: 'ancer.',
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search Services',
                            style: TextStyle(color: HexColor('#bfbdb6')),
                          ),
                          Icon(
                            EvaIcons.search,
                            color: HexColor('#bfbdb6'),
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'See all',
                          style: TextStyle(
                              color: HexColor('#EC0023'),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////
              Container(
                child: GetBuilder<FetchCategory>(builder: (fetchCategory) {
                  if (fetchCategory.category == null) {
                    return SizedBox(
                      child: Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 228, 225, 225),
                        highlightColor: Colors.white,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (() {
                                  // print(userid);fe
                                  // fetchCategory;
                                }),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Color.fromARGB(15, 0, 0, 0),
                                                blurRadius: 4,
                                                spreadRadius: 0,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.17,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      ),
                                      Container(
                                        child: const Center(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Color.fromARGB(15, 0, 0, 0),
                                                blurRadius: 4,
                                                spreadRadius: 0,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: fetchCategory.category.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (() {
                              // print(userid);fe
                              // fetchCategory;]
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => ServiceList(
                                      title:
                                          fetchCategory.category[index].title ??
                                              'title',
                                      listsize: 100,
                                      search: '',
                                      sorttitle: '',
                                      category:
                                          fetchCategory.category[index].id ??
                                              '',
                                      subcategory: ''))));
                            }),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.network(
                                      fetchCategory
                                              .category[index].image!.url ??
                                          'https://i.pinimg.com/564x/1c/2a/fd/1c2afd5df5bc136bfbae9ce51386cd5f.jpg',
                                      fit: BoxFit.fill,
                                    ),
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
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8))),
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        fetchCategory.category[index].title ??
                                            'title',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
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
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8))),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                }),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Rated',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => ServiceList(
                                    title: "Toprated",
                                    category: '',
                                    listsize: 100,
                                    search: '',
                                    sorttitle: '',
                                    subcategory: '',
                                  ))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
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
              TopRated(),
              InviteCard(),
            ],
          ),
        ));
  }
}

class InviteCard extends StatelessWidget {
  const InviteCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Invite your friends and family',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Introduce Lancer and get upto ₹ 50 '),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  // String token = SaveId.getToken();
                  // Future fetchServices() async {
                  //   Response response = await globalDio.get(
                  //     '/services/users?search=&page=1&pageSize=5&sort[title]=1&category=&subcategory=',
                  //     options: Options(
                  //       headers: {
                  //         "Authorization": "Bearer $token",
                  //       },
                  //     ),
                  //   );

                  //   print('------hello iam not error ------------');

                  //   print(response);
                  //   try {} catch (e) {
                  //     print('------hello iam error ------------');

                  //     print(e);
                  //   }
                  // }
                },
                child: const Text(
                  'Invite',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(primary: HexColor('EC0023')),
              ),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.9,
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
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}

class TopRated extends StatelessWidget {
  TopRated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: fetchServices('', 4, '', '', '', ''),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                child: Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 228, 225, 225),
                  highlightColor: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 8,
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(50, 0, 0, 0),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            offset: Offset(2, 2)),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4)),
                                    ),
                                    child: Image.network(
                                      '',
                                      fit: BoxFit.fill,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(15, 0, 0, 0),
                                          blurRadius: 4,
                                          spreadRadius: 0,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            top: 5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  color: Colors.blueAccent,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                              ),
                                              Text('Mohammed Arif'),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .favorite_border_outlined))
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            '',
                                            // services[index]['description'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton.icon(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.star_rounded,
                                                    color: Color.fromARGB(
                                                        255, 242, 218, 0),
                                                  ),
                                                  label: Text('5.5')),
                                              Text(' ₹ 10000')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              //  CircularProgressIndicator(),
            );
          }

          List services = snapshot.data!;

          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.47,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 8,
                      right: 8,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // fetchServices();
                        Map userInfo =
                            await getUserInfo(services[index]['user']);
                        Map data = await fetchProduct(services[index]['_id']);
                        print(data);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductView(
                                  data: data,
                                  user: userInfo,
                                )));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(50, 0, 0, 0),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(2, 2)),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                              ),
                              child: Image.network(
                                services[index]['images'][0]['url'],
                                fit: BoxFit.fill,
                              ),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.23,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(15, 0, 0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4)),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      top: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Container(
                                        //   decoration: const BoxDecoration(
                                        //     image: DecorationImage(
                                        //         fit: BoxFit.fill,
                                        //         image: NetworkImage(
                                        //             'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                                        //     borderRadius: BorderRadius.all(
                                        //         Radius.circular(6)),
                                        //     color: Colors.blueAccent,
                                        //   ),
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //       0.1,
                                        //   height: MediaQuery.of(context)
                                        //           .size
                                        //           .height *
                                        //       0.05,
                                        // ),
                                        Text(services[index]['title']),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.favorite_border_outlined))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      services[index]['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.star_rounded,
                                              color: Color.fromARGB(
                                                  255, 242, 218, 0),
                                            ),
                                            label: Text('5.5')),
                                        Text(' ₹ 10000')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

//================fgdsjn.kjnsd.kaj=======================ABVS,HJDFSBH SDFJLKJH===============================hjcvdashk/j/lijdw/ja======================================////===================--ihdfsjdfjeajgljgdsljgf
class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://i.pinimg.com/564x/1c/2a/fd/1c2afd5df5bc136bfbae9ce51386cd5f.jpg',
              fit: BoxFit.fill,
            ),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Container(
            child: const Center(
              child: Text(
                'Logo',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.4,
          )
        ],
      ),
    );
  }
}
