import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/APIs/AllChatApi.dart';
import 'package:lancer1/APIs/GetUserInfo.dart';
import 'package:lancer1/View/ChatScreen.dart';
import 'package:lancer1/View/Widgets/Search.dart';
import 'package:lancer1/sharedPreference.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Message',
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
                  EvaIcons.search,
                  color: HexColor('#bfbdb6'),
                ))
          ]),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: () {
                fetchAllChat();
                // String id = SaveId.getToken();
                // print(id);
                //    Map userInfo = await getUserInfo(data!['user']);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ChatScreen(user: ,

                //   ),
                // ));
              },
              leading: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Colors.blueAccent,
                ),
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              title: Text(
                'Mohammed Arif',
              ),
              subtitle: Text('hello'),
              trailing: Text('11:00 am'),
            );
          })),
    );
  }
}
