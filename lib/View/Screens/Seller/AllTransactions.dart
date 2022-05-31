import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('15182b'),
        title: const Text(
          'All Transactions',
          style: TextStyle(

              // fontWeight: FontWeight.w600
              ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Requested',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Recieved',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '₹ 2300',
                        ),
                        Text(
                          '02-march-2022',
                        ),
                        Text(
                          '02-march-2022',
                        ),
                      ],
                    ),
                  );
                })),
          ),

         
        ],
      ),
    );
  }
}
