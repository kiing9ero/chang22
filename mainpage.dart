import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedINdex = 0;
  TabController? controller;

  final fooditems = <Center>[
    Center(child: Text('식당이미지1')),
    Center(child: Text('식당이미지2')),
    Center(child: Text('식당이미지3')),
    Center(child: Text('식당이미지4')),
    Center(child: Text('식당이미지5')),
  ];

  final foodspot = <Center>[
    Center(child: Text('지역1')),
    Center(child: Text('지역2')),
    Center(child: Text('지역3')),
    Center(child: Text('지역4')),
    Center(child: Text('지역5')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: fooditems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  alignment: Alignment.center,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child:
                      TabBarView(controller: controller, children: fooditems),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: TabPageSelector(
                    controller: controller,
                    color: Colors.grey,
                    selectedColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '고객의 지역에 맞는 추천',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: foodspot.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            height: 100,
                            width: 100,
                            child: foodspot[index],
                          ),
                        );
                      })),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
