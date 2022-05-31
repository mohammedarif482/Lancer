import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/ChatScreen.dart';

class SellerMessage extends StatelessWidget {
  const SellerMessage({Key? key}) : super(key: key);

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
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: ((context) => ChatScreen()),
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
