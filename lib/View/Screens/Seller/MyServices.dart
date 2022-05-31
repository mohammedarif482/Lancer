import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lancer1/View/Screens/Buyer/ServiceView.dart';
import 'package:lancer1/View/Screens/Seller/CreateService.dart';
import 'package:lancer1/View/Screens/Seller/MyserviceView.dart';

class MyServices extends StatelessWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          'My Services',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: MyServiceCard(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: HexColor('ec0023'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateService(),
          ));
        },
        label: Text("Add Service"),
      ),
    );
  }
}

class MyServiceCard extends StatelessWidget {
  const MyServiceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => MyServiceView())));
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(50, 0, 0, 0),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(2, 2)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                        ),
                        child: Image.network(
                          'https://www.buttercup.in/case-studies/wp-content/uploads/2019/02/logo-design-1-768x432.jpg',
                          fit: BoxFit.fill,
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                'UI/Ui Desinging with prototype. kjm, ,mn,.km  mkljjyg gfytt yui8ukj ygiuyk myttoj htfytryub hgvjuygh juygiuy jvuygtuh uygiuhinmn jugjhjh hgjhju dsfjk kjasfn asfkj ,s',
                                style: TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
            );
          })),
      width: double.infinity,
    );
  }
}
