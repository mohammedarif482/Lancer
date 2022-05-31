import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lancer1/APIs/CategoryApi.dart';
import 'package:lancer1/APIs/CreateServiceApi.dart';
import 'package:lancer1/APIs/ShowSubCategory.dart';
import 'package:lancer1/DioConfig/configDio.dart';
import 'package:lancer1/Model/CreateServiceModel.dart';
import 'package:lancer1/Model/SubCategoryModel.dart';
import 'package:lancer1/Model/categoryModel.dart';
import 'package:lancer1/sharedPreference.dart';
import 'package:dio/src/multipart_file.dart' as multiPartFile;
import 'package:dio/src/form_data.dart' as formdata;

class CreateService extends StatefulWidget {
  CreateService({Key? key}) : super(key: key);

  @override
  State<CreateService> createState() => _CreateServiceState();
}

class _CreateServiceState extends State<CreateService> {
  final ImagePicker imagepicker = ImagePicker();

  List<XFile>? ImageFileList = [];

  List<Category> category = [];

  String? value;
  int selectedIndex = 0;
  String? servicetitle;
  String? servicedescription;
  String? servicecategory;
  String? servicesubcat;
  Packages? packages;
  List<Images> image = [];
  int? bdelivery;

  int? brevision;
  int? bprice;
  int? sdelivery;

  int? srevision;
  int? sprice;
  int? pdelivery;

  int? prevision;
  int? pprice;

  @override
  Widget build(BuildContext context) {
    // final scontroller = Get.put(SubCategory());
    ShowSubCategory fetchSubCategory = ShowSubCategory();

    final controller = Get.put(FetchCategory());

    List<String> categories = controller.category.map((e) => e.title!).toList();
    List<String> categoryId = controller.category.map((e) => e.id!).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create a Service',
        ),
        backgroundColor: HexColor('#15182b'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Add Service Title',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB // String? value;

                        (15, 0, 0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: TextField(
              onChanged: (value) {
                servicetitle = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Service title",
                hintStyle: TextStyle(color: HexColor('#bfbdb6')),
              ),
            ),
          ),
          const Text(
            'Add Service description',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                servicedescription = value;
              },
              maxLines: 7,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Service description",
                hintStyle: TextStyle(color: HexColor('#bfbdb6')),
              ),
            ),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(15, 0, 0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          const Text(
            'Add picture for your Service',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: () {
                selectedImages();
                // print(categories);
              },
              child: Container(
                child: ImageFileList!.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.image_search_outlined,
                            color: Color.fromARGB(163, 81, 80, 80),
                          ),
                          Text('Pick Image')
                        ],
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ImageFileList!.length,
                        itemBuilder: ((context, index) {
                          // return Container();
                          return Row(
                            children: [
                              const SizedBox(width: 5),
                              Image.file(File(ImageFileList![index].path)),
                              const SizedBox(width: 5),
                            ],
                          );
                        })),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(15, 0, 0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
          const Text(
            'Select Category',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Builder(builder: (context) {
                ShowSubCategory fetchSubCategory = ShowSubCategory();
                return DropdownButton<String>(
                  hint: const Text('category'),
                  value: value,
                  items: categories.map(buildMenuItem).toList(),
                  onChanged: (value) async {
                    int currentIndex = categories.indexOf(value!);

                    servicecategory = categoryId[currentIndex].toString();
                    List<Subcategory>? sub =
                        await fetchSubCategory.fetchSubCategory(
                      categoryId[currentIndex],
                      context,
                    );

                    Scaffold.of(context).showBottomSheet(
                      (context) => Container(
                        width: double.infinity,
                        child: Wrap(
                          // a: MainAxisSize.min,
                          runAlignment: WrapAlignment.spaceEvenly,
                          children: List.generate(
                            sub!.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  setState(() {});
                                  print(selectedIndex);
                                  servicesubcat = sub[selectedIndex].id;
                                  print(servicesubcat);
                                },
                                child: Chip(
                                  backgroundColor: selectedIndex == index
                                      ? HexColor('#Ec0023')
                                      : Colors.grey,
                                  label: Text(sub[index].title!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
          const Text(
            'Add Package Details',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const Text(
            'Basic',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Column(
            children: [
              // Container(
              //   child: TextField(
              //     onChanged: (value) {
              //       packages = Packages(
              //         basic: Basic(
              //           deliveryTime: 10,
              //           price: 1000,
              //           revision: 1,
              //         ),
              //       );
              //     },
              //     maxLines: 5,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hintText: "Package description",
              //       hintStyle: TextStyle(color: HexColor('#bfbdb6')),

              //       // suffixIconColor: HexColor('#bfbdb6'),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Color.fromARGB(15, 0, 0, 0),
              //           blurRadius: 4,
              //           spreadRadius: 0,
              //           offset: Offset(0, 2),
              //         ),
              //       ],
              //       border: Border.all(color: Color.fromARGB(132, 58, 57, 57)),
              //       color: Colors.white,
              //       borderRadius: const BorderRadius.all(Radius.circular(8))),
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   width: MediaQuery.of(context).size.width * 0.9,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Time of Delivery'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          bdelivery = int.parse(value);
                          // packages = Packages(
                          //   basic: Basic(
                          //     deliveryTime: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " 3 days",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add No of Revisions'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          brevision = int.parse(value);

                          // packages = Packages(
                          //   basic: Basic(
                          //     revision: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  3 times",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Price of Package'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          bprice = int.parse(value);
                          // packages = Packages(
                          //   basic: Basic(
                          //     price: int.parse(value),
                          //   ),
                          // );
                          // packages!.basic!.price = value as int?;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "price",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            'Standard',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Time of Delivery'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          sdelivery = int.parse(value);

                          // packages = Packages(
                          //   standard: Standard(
                          //     deliveryTime: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " 3 days",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add No of Revisions'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          srevision = int.parse(value);

                          // packages = Packages(
                          //   standard: Standard(
                          //     revision: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "price",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Price of Package'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          sprice = int.parse(value);

                          // packages = Packages(
                          //   standard: Standard(
                          //     price: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "price",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            'Premium',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Time of Delivery'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          pdelivery = int.parse(value);

                          // packages = Packages(
                          //   premium: Premium(
                          //     deliveryTime: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " 3 days",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add No of Revisions'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          prevision = int.parse(value);

                          // packages = Packages(
                          //   premium: Premium(
                          //     revision: int.parse(value),
                          //   ),
                          // );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  3 times",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add Price of Package'),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(132, 58, 57, 57)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          pprice = int.parse(value);

                          // packages = Packages(
                          //     premium: Premium(price: int.parse(value)));
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "price",
                          hintStyle: TextStyle(color: HexColor('#bfbdb6')),

                          // suffixIconColor: HexColor('#bfbdb6'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 8),
            child: Text('*Confirm all details entered before you publish'),
          ),
          ElevatedButton(
            onPressed: () {
              packages = Packages(
                  basic: Basic(
                    deliveryTime: bdelivery,
                    price: bprice,
                    revision: brevision,
                  ),
                  standard: Standard(
                    deliveryTime: sdelivery,
                    price: sprice,
                    revision: srevision,
                  ),
                  premium: Premium(
                    price: pprice,
                    deliveryTime: pdelivery,
                    revision: prevision,
                  ));

              CreateServiceModel createservice = CreateServiceModel(
                  description: servicedescription,
                  title: servicetitle,
                  category: servicecategory,
                  subcategory: servicesubcat,
                  packages: packages,
                  images: image
                  // images: ImageFileList;
                  );
              // print(packages!.basic);
              // var userData = SaveId.getUserData();
              // print(userData);'
              String token = SaveId.getToken();

              CreateServicePost(
                context,
                createservice,
                token,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text('Publish'),
            ),
            style: ElevatedButton.styleFrom(primary: HexColor('#EC0023')),
          )
        ],
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  void selectedImages() async {
    final List<XFile>? selectedImages = await imagepicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      ImageFileList!.addAll(selectedImages);
      // setState(() {});j

      File file = File(ImageFileList![0].path);
      try {
        var userData = SaveId.getUserData();
        Map map = jsonDecode(userData);
        var formData = formdata.FormData.fromMap(
          {
            'file': await multiPartFile.MultipartFile.fromFileSync(
              file.path,
              filename: ImageFileList![0].path,
            ),
          },
        );

        // print(formData);
        // print(file.path);
        // print(ImageFileList![0].name);

        dynamic response = await globalDio.post(
          "/uploads/file",
          data: formData,
          //  {
          //   "image": await multiPartFile.MultipartFile.fromFile(
          //     file.path,
          //     filename: ImageFileList![0].name,
          //   )
          // },
          options: Options(
            headers: {
              "Authorization": "Bearer ${map["token"]}",
            },
          ),
        );

        Map imageDetails = jsonDecode(response.data);

        image.add(
          Images(publicId: imageDetails['public_id'], url: imageDetails['url']),
        );

        print(response.data.runtimeType);
        print(response.data);
        print(image[0].publicId);
      } on DioError catch (e) {
        print('---------------------ssssssssssssssssss----------------');
        print('==================${e.response!.statusMessage}');
      }
    }
  }
}
