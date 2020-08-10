import 'package:flutter/material.dart';
import 'package:test/bottom_nav_bar.dart';
import 'package:test/pages/home_page.dart';
import 'package:test/widgets/home/home_header.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/video_model.dart';
void main() => runApp(MyApp());



class MyApp extends StatefulWidget{
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  Future<List<Video>> futureVideo;
  List<Video> videoList =[];
  @override
  void initState() {
    super.initState();
     fetchVideo();
  }

  Future<List<Video>> fetchVideo() async {
    final response =
    await http.get('https://www.pinkvilla.com/feed/video-test/video-feed.json');
    List<Video> data =[];
    if (response.statusCode == 200)
    {
      print(response.body);
      List<dynamic>temp =json.decode(response.body);
      print(response.body);
      print(temp.length);
      for( int i =0; i<temp.length;i++){
        Video v=  Video.fromJson(temp.elementAt(i));
        data.add(v);
      }
      print(data.length);
      videoList =data;
      setState(() {
      });
      return data;
    }
    else {
      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  Stack(
              children: <Widget>[
               HomeScreen(videoList: videoList),
               BottomNavigation(),
            //   homeHeader(),
              ]
          ),
        ),
    );
  }
}