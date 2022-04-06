import 'package:final_project/search_list.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(width: 3),
                  Text(
                    '검색',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              )),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => SearchList()),
                              ),
                            );
                          },
                          icon: Icon(Icons.search)),
                      labelText: '지역 / 음식종류 레스토랑 검색',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                child: Text('지도'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
