import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/ServicesApi.dart';
import 'package:lancer1/View/Widgets/ListCard.dart';

import 'UserHome.dart';

class ServiceList extends StatelessWidget {
  ServiceList({
    Key? key,
    required this.title,
    required this.listsize,
    required this.search,
    required this.sorttitle,
    required this.category,
    required this.subcategory,
  }) : super(key: key);

  final String title;
  int listsize;
  String search;
  String sorttitle;
  String category;
  String subcategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: HexColor('15182b'),
        ),
        body: FutureBuilder<List>(
            future: fetchServices(category,listsize,search,sorttitle,subcategory,title),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: HexColor('#ec0023')),
                );
              }

              List services = snapshot.data!;

              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  services[index]['images'][0]['url'],
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
                                        bottomLeft: Radius.circular(8))),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Expanded(
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            services[index]['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Wrap(
                                          children: const [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color.fromARGB(
                                                  255, 242, 218, 0),
                                            ),
                                            Text('5.5')
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                                            borderRadius: BorderRadius.all(
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
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(''),
                                          Icon(Icons.favorite_border_outlined)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                              )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            }));
  }
}
