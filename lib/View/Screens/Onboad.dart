import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/SignIn.dart';
import 'package:lancer1/View/Screens/SignUp.dart';
import 'package:lancer1/View/Widgets/Lancer.dart';
import 'package:lancer1/View/Widgets/OnboardVideo.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            child: const VideoPlayerScreen()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: HexColor('15182b'),
            ),
            height: MediaQuery.of(context).size.height * 0.22,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3.9,
          left: MediaQuery.of(context).size.width / 9.5,
          child: Lancerhead(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.75,
          left: MediaQuery.of(context).size.width / 9.5,
          child: Text(
            'Get your work done\n with Lancer',
            style: GoogleFonts.epilogue(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.4,
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.066,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: BaseContainerOnBoard(context, 'Find a seller')),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.066,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: BaseContainerOnBoard(context, "Become a seller")),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.4,
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.066,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: CardImageOnboard(context,
                      "https://i.pinimg.com/564x/5a/b7/b7/5ab7b7455dcc415b63587b9532053e65.jpg"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.066,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: CardImageOnboard(context,
                      "https://i.pinimg.com/564x/1b/cf/2b/1bcf2b1465d549f00e5f9f3d6ac7e136.jpg"),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextButton(
              child: Text(
                'Sign In',
                style: GoogleFonts.epilogue(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignIn()));
              },
            ),
          ),
        ),
        Positioned(
          left: 285,
          top: MediaQuery.of(context).size.height / 1.1,
          child: TextButton(
            child: Text(
              'Sign Up',
              style: GoogleFonts.epilogue(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
        ),
      ],
    ));
  }
}

//==============================================---------------------===----------------------=========-----------===============
Container BaseContainerOnBoard(BuildContext context, title) {
  return Container(
    decoration: BoxDecoration(
      color: HexColor("EC0023"),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: GoogleFonts.epilogue(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        )
      ],
    ),
    height: MediaQuery.of(context).size.height * 0.17,
    width: MediaQuery.of(context).size.width * 0.4,
  );
}

Container CardImageOnboard(BuildContext context, image) {
  return Container(
    child: Image.network(
      image,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    ),
    height: MediaQuery.of(context).size.height * 0.13,
    width: MediaQuery.of(context).size.width * 0.4,
  );
}
