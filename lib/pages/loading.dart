import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutt/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldtime() async{

    WorldClock instance = WorldClock(location: 'Berlin',flag: ' assets/United_Kingdom_flag.png',
        url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isdaytime': instance.isdaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body:Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
           duration: Duration(milliseconds: 1200),
        ),
      ),
    );
  }
}
