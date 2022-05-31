import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    // this.name,
    // this.image,
    required this.user,
    this.delivery,
    this.price,
    this.revision,
  });
  // String name;
  // String image;
  // bool
  Map user;
  int? price;
  int? delivery;
  int? revision;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: HexColor('#bfbdb6'),
              )),
          backgroundColor: Colors.white,
          title: Text(
            user['name'],
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user['image']['url'])),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Colors.blueAccent,
                ),
                width: 45,
                height: 45,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              child: Text('data'),
            )),
            Column(
              children: [
                ///////////////////////////////////////////////////////

                serviceSummary(),
                //////////////////////////////////////////////////////////////
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(15, 0, 0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      // expands: true,
                      // maxLength: 500,
                      // maxLines: 6,
                      // minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write a message",

                        hintStyle: TextStyle(color: HexColor('#bfbdb6')),
                        suffixIcon: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  color: HexColor('#ec0023'),
                                  fontWeight: FontWeight.w600),
                            )),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              EvaIcons.plusCircleOutline,
                              color: HexColor('#bfbdb6'),
                            )),
                        prefixIconColor: Colors.black,
                        // suffixIconColor: HexColor('#bfbdb6'),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding serviceSummary() {
    if (revision != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Service summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price'),
                    Text('₹' + price.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Time'),
                    Text(delivery.toString() + ' days'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Revision '),
                    Text(revision.toString() + ' times'),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Click on",
                      ),
                      TextSpan(
                          text: " send ",
                          style: TextStyle(color: HexColor('EC0023'))),
                      const TextSpan(
                        text: "button to confirm",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            color: Color.fromARGB(106, 195, 195, 195),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(),
      );
    }
  }
}
