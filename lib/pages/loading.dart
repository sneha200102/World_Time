

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';
  void setupWorldTime()
  async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: 'germany.png',
      url: 'Europe/Berlin',

    );
    await instance.getTime();

    Navigator.restorablePushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,

    });

    // print(instance.time);
    // setState(() {
    //   time = instance.time!;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
    child: SpinKitRotatingCircle(
      color: Colors.white,
      size: 90.0,
    ),
    ),
    );
  }
}
