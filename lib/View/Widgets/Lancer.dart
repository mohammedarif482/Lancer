import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Lancerhead extends StatelessWidget {
  const Lancerhead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.epilogue(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700),
        ),
        children: <TextSpan>[
          TextSpan(text: "L", style: TextStyle(color: HexColor('EC0023'))),
          const TextSpan(
            text: 'ancer.',
          )
        ],
      ),
    );
  }
}
