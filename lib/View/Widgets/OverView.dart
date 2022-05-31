import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.number,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('#15182b'),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  number,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: HexColor("#ec0023")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
