import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(246, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
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
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Services",
                        hintStyle: TextStyle(color: HexColor('#bfbdb6')),
                        suffixIcon: Icon(
                          EvaIcons.search,
                          color: HexColor('#bfbdb6'),
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: HexColor('#bfbdb6'),
                            )),
                        prefixIconColor: Colors.black,
                        // suffixIconColor: HexColor('#bfbdb6'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
