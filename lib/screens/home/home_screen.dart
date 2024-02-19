// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:guggal_social/services/auth_services.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:guggal_social/widgets/brand_container.dart';
import 'package:guggal_social/widgets/brand_name.dart';
import 'package:guggal_social/widgets/car_card.dart';
import 'package:guggal_social/widgets/gradient_text.dart';
import 'package:guggal_social/widgets/pop_ups.dart';
import 'package:guggal_social/widgets/social_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isLoading = false;
  // UserModel currentUser = UserModel();
  // List<TodoModel> listOfTodos = [];

  // @override
  // void initState() {
  //   super.initState();
  //   getInitData();
  // }

  // getInitData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   currentUser = (await BaseService.getCurrentUser())!;
  //   listOfTodos = await TodoServices.getAllTodos(context);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  int dotPosition = 0;

  List<String> list1 = ["SEARCH", "ASSIST ME", "CONSULT US"];
  int slectedIndex = 0;
  List<String> list2 = ["03", "05", "10", "15", "20", "30", "50"];

  String dropdownvalue = 'Choose City';

  var items = [
    'Choose City',
    'City 1',
    'City 2',
    'City 3',
    'City 4',
  ];
  String dropdownvalue1 = 'Fuel Type';

  var items1 = [
    'Fuel Type',
    'Fuel 1',
    'Fuel 2',
    'Fuel 3',
    'Fuel 4',
  ];
  List<Map<String, dynamic>> brandList = [
    {
      "name": "BMW",
      "image": "b1",
    },
    {
      "name": "Ford",
      "image": "b2",
    },
    {
      "name": "Honda",
      "image": "b3",
    },
    {
      "name": "Audi",
      "image": "b4",
    },
    {
      "name": "Mercedes",
      "image": "b5",
    },
    {
      "name": "Volkswagen",
      "image": "b6",
    },
    {
      "name": "Skoda",
      "image": "b7",
    },
    {
      "name": "Nissan",
      "image": "b8",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: BrandColors.blackColor1,
        surfaceTintColor: BrandColors.blackColor1,
        // elevation: 3,
        title: const BrandName(),
        actions: [
          const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4,
          ),
          const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () async {
              // await AuthService.logOut(context);
              showLogOutPopUp(context);
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/default.png'),
            ),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2,
            ),
            Container(
              width: size.width,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: size.width,
              child: Center(
                child: Text2(text1: 'FIND YOUR', text2: 'PERFECT CAR'),
              ),
            ),
            GridView.builder(
              itemCount: list1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3,
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 0),
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  // height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: Offset(1, 1),
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(),
                  child: Center(
                    child: Text(
                      list1[index],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: BrandColors.greyColor3,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: size.width / 1.3,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Eg: ",
                          style: TextStyle(
                            fontSize: 10,
                            // fontVariations: const [FontVariation('wght', 800)],
                            fontWeight: FontWeight.w500,
                            color: BrandColors.greyColor,
                          ),
                        ),
                        TextSpan(
                          text: "Tata Nexon",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: BrandColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 128,
            //   // margin: EdgeInsets.symmetric(horizontal: 16),
            //   child: ListView.builder(
            //       itemCount: list2.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               slectedIndex = index;
            //             });
            //           },
            //           child: Stack(
            //             clipBehavior: Clip.none,
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: slectedIndex == index
            //                       ? BrandColors.redColor
            //                       : BrandColors.greyColor3,
            //                   borderRadius: BorderRadius.circular(4),
            //                   boxShadow: const [
            //                     BoxShadow(
            //                       blurRadius: 3,
            //                       offset: Offset(1, 1),
            //                       color: Color.fromRGBO(0, 0, 0, 0.25),
            //                     ),
            //                   ],
            //                 ),
            //                 padding: const EdgeInsets.all(12),
            //                 margin: const EdgeInsets.only(right: 16, left: 12),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       'UNDER',
            //                       style: TextStyle(
            //                         fontSize: slectedIndex == index ? 24 : 18,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                     Text(
            //                       list2[index],
            //                       style: TextStyle(
            //                         fontSize: slectedIndex == index ? 24 : 18,
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.w700,
            //                       ),
            //                     ),
            //                     Text(
            //                       'LAKSHS',
            //                       style: TextStyle(
            //                         fontSize: slectedIndex == index ? 24 : 18,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.white,
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //               Positioned(
            //                 right: 4,
            //                 top: 15,
            //                 child: Container(
            //                   height: 80,
            //                   width: 3,
            //                   decoration: BoxDecoration(
            //                     color: BrandColors.greyColor3,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       }),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  list2.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        slectedIndex = index;
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: slectedIndex == index
                                ? BrandColors.redColor
                                : BrandColors.greyColor3,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(1, 1),
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 16, left: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'UNDER',
                                style: TextStyle(
                                  fontSize: slectedIndex == index ? 24 : 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                list2[index],
                                style: TextStyle(
                                  fontSize: slectedIndex == index ? 24 : 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'LAKHS',
                                style: TextStyle(
                                  fontSize: slectedIndex == index ? 24 : 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 4,
                          top: 15,
                          child: Container(
                            height: 80,
                            width: 3,
                            decoration: BoxDecoration(
                              color: BrandColors.greyColor3,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.symmetric(vertical: 24),
              height: 350,
              // margin: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const CarCard();
                        }),
                  ),
                  Positioned(
                    right: 0,
                    top: 160,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: BrandColors.greyColor3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 0,
                  //   top: 170,
                  //   child: Container(
                  //     padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  //     decoration: BoxDecoration(
                  //       color: BrandColors.greyColor3,
                  //       borderRadius: BorderRadius.circular(100),
                  //     ),
                  //     child: Icon(
                  //       Icons.arrow_back_ios,
                  //       color: Colors.white,
                  //       size: 16,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // height: 200,
              // color: Colors.red,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "FUEL ",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: BrandColors.greyColor,
                              ),
                            ),
                            TextSpan(
                              text: "PRICE",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: BrandColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 300,
                      // )
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(115, 115, 115, 1),
                              ),
                            ),
                            child: DropdownButton(
                              underline: Container(),
                              value: dropdownvalue,
                              icon: Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: BrandColors.redColor,
                                ),
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(95, 95, 95, 1),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            // padding: EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(115, 115, 115, 1),
                              ),
                            ),
                            child: DropdownButton(
                              padding: const EdgeInsets.all(0),
                              underline: Container(),
                              value: dropdownvalue1,
                              icon: Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: BrandColors.redColor,
                                ),
                              ),
                              items: items1.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(95, 95, 95, 1),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue1 = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: BrandColors.greyColor3,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'INR',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '100.5',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(0),
                      //   margin: EdgeInsets.all(0),
                      //   width: 130,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       fit: BoxFit.fill,
                      //       image: AssetImage('assets/images/logo1.png'),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: 70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tier_back.png'),
                  fit: BoxFit.fill,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "BROWSE BY ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BrandColors.greyColor,
                            ),
                          ),
                          TextSpan(
                            text: "BRANDS",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: BrandColors.redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return BrandContainer(
                          brandImage: brandList[index]['image'],
                          brandName: brandList[index]['name']);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPaint(
                  // painter: SlantedBorderPainter(
                  //     color: BrandColors.greyColor3, slantHeight: 70),
                  child: Container(
                    decoration: BoxDecoration(
                      color: BrandColors.greyColor3,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: const Center(
                      child: Text(
                        'LOAD MORE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // SlantedBorderContainer(
                //   width: 200,
                //   height: 100,
                //   color: Colors.blue,
                //   slantHeight: 20,
                //   child: Center(
                //     child: Text(
                //       'Slanted Container',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
            Container(
              width: size.width,
              height: 2,
              decoration: BoxDecoration(
                color: BrandColors.greyColor3,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              height: 390,
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 30, top: 2, bottom: 2, left: 2),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: Offset(1, 1),
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ],
                    ),
                    width: size.width / 1.4,
                    // height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/img5.png',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: size.width / 3.7,
                              top: 140,
                              child: Container(
                                width: 80,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/youtube.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Thar is back',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: BrandColors.greyColor3,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'The Thar was first introduced in 2010\nas a modernized version ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: BrandColors.greyColor3,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "CAR ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: BrandColors.greyColor,
                      ),
                    ),
                    TextSpan(
                      text: "COMPARISON",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: BrandColors.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CarouselSlider(
              items: items
                  .map(
                    (e) => Container(
                      height: 200,
                      width: size.width / 1.2,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(1, 1),
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width / 2.4,
                                    height: 140,
                                    child: Image.asset(
                                      'assets/images/img4.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 2.4,
                                    height: 140,
                                    child: Image.asset(
                                      'assets/images/img4.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 55,
                                left: size.width / 2.63,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.black,
                                  ),
                                  child: const Text(
                                    'VS',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width / 2.4,
                                padding: const EdgeInsets.only(left: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Maruti',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: BrandColors.greyColor3,
                                      ),
                                    ),
                                    Text(
                                      'Brezza',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: BrandColors.redColor,
                                      ),
                                    ),
                                    Text(
                                      '₹7.99 - 13.99 Lakhs',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: BrandColors.greyColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width / 2.4,
                                // padding: const EdgeInsets.only(left: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Maruti',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: BrandColors.greyColor3,
                                      ),
                                    ),
                                    Text(
                                      'Brezza',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: BrandColors.redColor,
                                      ),
                                    ),
                                    Text(
                                      '₹7.99 - 13.99 Lakhs',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: BrandColors.greyColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                // aspectRatio: 1.8,
                // height: 240,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                enlargeCenterPage: false,
                viewportFraction: 0.9,
                // enlargeFactor: 0.5,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (val, carouselPageChangedReason) {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items: items
                  .map(
                    (e) => Stack(
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 12),
                          // margin: const EdgeInsets.only(
                          //     right: 30, top: 2, bottom: 2, left: 2),
                          // margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          // padding: const EdgeInsets.all(6),
                          width: size.width, height: 220,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: Offset(1, 1),
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('assets/images/img6.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          // height: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Stack(
                              //   children: [
                              // Image.asset(
                              //   'assets/images/img6.png',
                              //   height: 220,
                              // ),
                              //   ],
                              // ),
                              const Text(
                                'Youtube Creative',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 20,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/youtube.png',
                                        height: 10,
                                        width: 10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'About Us Video',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Image.asset(
                            'assets/images/logo2.png',
                            height: 50,
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                // aspectRatio: 1.8,
                // height: 350,
                height: 220,

                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                enlargeCenterPage: false,
                viewportFraction: 1,
                // enlargeFactor: 0.5,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (val, carouselPageChangedReason) {
                  setState(() {
                    dotPosition = val;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                  dotsCount: items.length,
                  position: dotPosition,
                  decorator: DotsDecorator(
                    size: const Size(6, 6),
                    activeSize: const Size(6, 6),
                    color: BrandColors.greyColor3,
                    activeColor: BrandColors.redColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 16, bottom: 8),
              child: Text2(text1: 'TOP PICKS FOR', text2: 'YOU'),
            ),
            CarouselSlider(
              items: items
                  .map(
                    (e) => Container(
                      // margin: const EdgeInsets.only(
                      //     right: 30, top: 2, bottom: 2, left: 2),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(1, 1),
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ],
                      ),
                      width: size.width / 1.2,
                      // height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/img1.png',
                                height: 200,
                                width: size.width / 1.2,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: size.width / 3.2,
                                top: 75,
                                child: Container(
                                  width: 80,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/youtube.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Thar is back',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: BrandColors.greyColor3,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'The Thar was first introduced in 2010\nas a modernized version ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: BrandColors.greyColor3,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                // aspectRatio: 1.8,
                height: 300,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                enlargeCenterPage: false,
                viewportFraction: 0.87,
                // enlargeFactor: 0.5,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (val, carouselPageChangedReason) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, bottom: 12),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "NEWS ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: BrandColors.greyColor,
                      ),
                    ),
                    TextSpan(
                      text: "UPDATE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: BrandColors.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              // height: 200,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BrandName(),
                      SocialCircle(img: 'email.png'),
                      SocialCircle(img: 'facebook.png'),
                      SocialCircle(img: 'twitter.png'),
                      SocialCircle(img: 'youtub.png'),
                      SocialCircle(img: 'insta.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '@2023',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: size.width,
                    height: 5,
                    color: BrandColors.greyColor3,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Powered by ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      BrandName(),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlantedBorderContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double slantHeight;
  final Widget child;

  const SlantedBorderContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.slantHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: SlantedBorderPainter(color: color, slantHeight: slantHeight),
      child: child,
    );
  }
}

class SlantedBorderPainter extends CustomPainter {
  final Color color;
  final double slantHeight;

  SlantedBorderPainter({required this.color, required this.slantHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - slantHeight)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
