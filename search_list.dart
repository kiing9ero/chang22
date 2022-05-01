import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:vegan/vegan_service.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VeganService>(
      builder: (context, veganSevice, child) {
        veganSevice.getList();
        List<Map<String, dynamic>> shopList = veganSevice.veganLevelList;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                '단계별 식당 추천(${veganSevice.veganLevel})',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.topLeft,
                            height: 90,
                            width: 250,
                            child: ListTile(
                              leading: Image.network(
                                shopList[index]['img'],
                                fit: BoxFit.fill,
                                height: 90,
                                width: 120,
                              ),
                              title: Text(shopList[index]['name']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${shopList[index]['item']}'),
                                  Text('위치 : ${shopList[index]['location']}'),
                                  Text('${shopList[index]['delivery']}')
                                ],
                              ),
                              onTap: () {
                                launch(shopList[index]['url']);
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.black,
                            height: 9,
                          );
                        },
                        itemCount: shopList.length)),
              ],
            ),
          ),
        );
      },
    );
  }
}
