import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:chang_22_project/search_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:geolocator/geolocator.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _editingController;
  late Position _position;

  Double? centerLat;
  Double? centerLng;

  @override
  void initState() {
    super.initState();
  }

  Future<Position> getPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      _position = currentPosition;
    });

    return _position;
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
            TextButton(
                onPressed: () {
                  getPosition();
                },
                child: Text('location')),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: getPosition(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return KakaoMapView(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      kakaoMapKey: '2e2b28d7866e8c1a3a8c36fb3279c372',
                      lat: _position.latitude,
                      lng: _position.longitude,
                      showMapTypeControl: true,
                      showZoomControl: true,
                      markerImageURL:
                          'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                      onTapMarker: (message) async {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Marker is clicked')));

                        //await _openKakaoMapScreen(context);
                      });
                })
          ],
        ),
      ),
    );
  }
}
