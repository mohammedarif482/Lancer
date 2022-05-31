import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Widgets/ReviewCard.dart';

class AllReviews extends StatelessWidget {
  const AllReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#15182b'),
          title: Text('All Reviews'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: const Text(
                  'All Review',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: ((context, index) {
                    return ReviewCard();
                  })),
            ),

            // Container(
            //   child: ListView.builder(
            //       physics: BouncingScrollPhysics(),
            //       itemCount: 5,
            //       itemBuilder: ((context, index) {
            //         return Padding(
            //             padding: const EdgeInsets.all(8), child: ReviewCard());
            //       })),
            //   width: double.infinity,
            // )
          ],
        ),
      ),
    );
  }
}
