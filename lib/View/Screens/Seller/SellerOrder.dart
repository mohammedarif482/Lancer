import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SellerOrders extends StatelessWidget {
  const SellerOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Manage Orders',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            labelColor: HexColor('ec0023'),
            unselectedLabelColor: HexColor('#bfbdb6'),
            indicatorColor: HexColor('ec0023'),
            onTap: (index) {
              // Tab index when user select it, it start from zero
            },
            tabs: const [
              Tab(
                child: Text(
                  'Pending',
                  style: TextStyle(
                      // color: HexColor('#ec0023'),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                      // color: HexColor('#ec0023'),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingWidget(),
            CompletedWidget(),
          ],
        ),
      ),
    );
  }
}

class PendingWidget extends StatelessWidget {
  const PendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.blueAccent,
              ),
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            title: Text('Mohammed Arif'),
            subtitle: Text('hkasjdk kjnakdsm kasjdlk,m asnd,m,amd'),
            trailing: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '2 days left',
                  style: TextStyle(
                      color: HexColor('#bfbdb6'), fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('₹ 1000'),
              ],
            ),
          );
        }),
        separatorBuilder: (context, index) => Divider(
              height: 2,
            ),
        itemCount: 5);
  }
}

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/79/7c/94/797c947d42c52bfc2170aa34cf4fe37f.jpg')),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.blueAccent,
              ),
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            title: Text('Mohammed Arif'),
            subtitle: Text('hkasjdk kjnakdsm kasjdlk,m asnd,m,amd'),
            trailing: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Completed',
                  style: TextStyle(
                      color: HexColor('#bfbdb6'), fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('₹ 1000'),
              ],
            ),
          );
        }),
        separatorBuilder: (context, index) => Divider(
              height: 2,
            ),
        itemCount: 15);
  }
}
