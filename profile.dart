import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '프로필',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Text('이미지'),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '닉네임 : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '상혁',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '채식연차 : ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1년',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Text('내 리뷰 보기'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(
                      '프로필 수정',
                      style: TextStyle(color: Colors.black),
                    )))
          ],
        ),
      ),
    );
  }
}
