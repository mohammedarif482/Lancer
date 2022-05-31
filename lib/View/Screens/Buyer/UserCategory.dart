import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/CategoryApi.dart';
import 'package:lancer1/View/Screens/Buyer/ServiceList.dart';
import 'package:lancer1/View/Widgets/Search.dart';

class UserCategory extends StatelessWidget {
  UserCategory({Key? key}) : super(key: key);

  FetchCategory fetchCategory = Get.put(FetchCategory());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Category',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Icon(
                  EvaIcons.searchOutline,
                  color: HexColor('#bfbdb6'),
                ))
          ]),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Graphics & Designs',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943793/Lancer-Statics/web-design_z9s3jn.png',
              height: 35,
              width: 35,
            ),
            title: Text('Graphics & Designs'),
            subtitle: Text('Logo Design,Storyboards,Book Design,'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Digital Marketing',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943680/Lancer-Statics/email_lwtdp5.png',
              height: 35,
              width: 35,
            ),
            title: Text('Digital Marketing'),
            subtitle: Text('Logo Design,Storyboards,Book Design,'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Video & Animationr',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943791/Lancer-Statics/video_tp6l0n.png',
              height: 35,
              width: 35,
            ),
            title: Text('Video & Animation'),
            subtitle: Text('Video Editing, Shorts Video Ads, Logo Animation'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Programming & Tech',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943672/Lancer-Statics/code_nmywzc.png',
              height: 35,
              width: 35,
            ),
            title: Text('Programming & Tech'),
            subtitle: Text('Web Programming,Mobile Apps, Desktop Application,'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Business',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943670/Lancer-Statics/business_jmbojs.png',
              height: 35,
              width: 35,
            ),
            title: Text('Business'),
            subtitle: Text(
                'Market Research ,Sales ,E-Commerce Management, Customer Care'),
          ),
          // Divider(
          //   height: 2,
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => ServiceList(title: 'Trending'),
          //     ));
          //   },
          //   leading: Image.network(
          //     'https://mohammedarif-web.github.io/lancerassets/img/trending.png',
          //     height: 35,
          //     width: 35,
          //   ),
          //   title: Text('Trending'),
          //   subtitle: Text(
          //       'Data, Architecture & Interior Design, Dropshipping, Game Development'),
          // ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Lifestyle',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943681/Lancer-Statics/lifestyle_t2lynl.png',
              height: 35,
              width: 35,
            ),
            title: Text('Lifestyle '),
            subtitle: Text('Online Tutoring, Gaming, Astrology & Psychics'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Writing & Translation',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943676/Lancer-Statics/edit_nz980c.png',
              height: 35,
              width: 35,
            ),
            title: Text('Writing & Translation'),
            subtitle: Text(
                'Articles & Blog Posts, Translation, Proofreading & Editing, Resume Writing'),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServiceList(
                    title: 'Music & Audios',
                    category: '',
                    listsize: 100,
                    search: '',
                    sorttitle: '',
                    subcategory: ''),
              ));
            },
            leading: Image.network(
              'https://res.cloudinary.com/lancer/image/upload/v1652943683/Lancer-Statics/music_nss0jz.png',
              height: 35,
              width: 35,
            ),
            title: Text('Music & Audios'),
            subtitle: Text(
                'Voice Over, Producers & Composers, Singers & Vocalists, Mixing & Mastering'),
          ),
        ],
      ),
    );
  }
}
