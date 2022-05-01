import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:vegan/mainpage.dart';

import 'package:vegan/search_list.dart';
import 'package:vegan/vegan_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VeganService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 화면에 보이는 영역
    return Consumer<VeganService>(builder: (context, veganService, child) {
      return SafeArea(
        child: Scaffold(
          body: IntroductionScreen(
            pages: [
              // 페이지1
              PageViewModel(
                title: "인트로 사진 및 간략한 소개",
                bodyWidget: Text("body1"),
              ),

              // 페이지2
              PageViewModel(
                titleWidget: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '어느단계의 채식을 하시나요?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                bodyWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  veganService.veganLevel = 'vegan';
                                });

                                print(veganService.veganLevel);
                                veganService.getList();
                                print(veganService.veganLevelList[0]);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '비건',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  veganService.veganLevel = 'lacto';
                                });

                                print(veganService.veganLevel);
                                veganService.getList();
                                print(veganService.veganLevelList[0]);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '락토',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  veganService.veganLevel = 'ovo';
                                });

                                print(veganService.veganLevel);
                                veganService.getList();
                                print(veganService.veganLevelList[0]);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '오보',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  veganService.veganLevel = 'lacto-ovo';
                                });

                                print(veganService.veganLevel);
                                veganService.getList();
                                print(veganService.veganLevelList[0]);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '락토-오보',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  veganService.veganLevel = 'pesco';
                                });

                                print(veganService.veganLevel);
                                veganService.getList();
                                print(veganService.veganLevelList[0]);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '페스코',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              PageViewModel(
                titleWidget: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '혹시 못 먹는 음식이 있나요?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                bodyWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 260,
                          child: Text(
                            '알레르기가 있는 식품을 선택해주세요.\n좋아하지 않는 재료를 골라도 괜찮지만,\n추천 음식점의 폭이 줄어들 수 있습니다.',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, height: 1.4),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '토마토',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '아보카도',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '오이',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '~',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: Text(
                                '~',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
            done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            onDone: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
