import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Invite extends StatelessWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('15182b'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ))),
          const Text(
            'Invite & Earn Rewards',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 15,
              right: 15,
            ),
            child: Text(
              'Invite friends & family and earn ₹ 50 rewards each',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://mohammedarif-web.github.io/lancerassets/img/referel.png',height: 300,),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      spacing: 5,
                      children: const [
                        Icon(Icons.stars, color: Colors.white),
                        Text(
                          '₹ 100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Rewards Earned',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      spacing: 5,
                      children: const [
                        Icon(Icons.person_pin, color: Colors.white),
                        Text(
                          '3 Person',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Successfully refered',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: HexColor('ec0023')),
          ),
          Container(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Share Link',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: HexColor('EC0023')),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
