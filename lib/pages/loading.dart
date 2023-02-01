import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/pages/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async{
  // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // Map data = jsonDecode(response.body);
  // print(data['title']);
  // }
  void getNewData() async {
    WorldTime instance = WorldTime(
        url: 'Africa/Dar_es_Salaam', flag: 'avatar.png', location: 'Dar_es_Salaam');
    await instance.getTime();
    setState(() {
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime':instance.isDaytime,
    });
    });
  }

  @override
  void initState() {
    super.initState();
    getNewData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: const Center(
      child: SpinKitFoldingCube(
        color: Colors.white,
        size: 80.0,
      ),
    ));
  }
}
