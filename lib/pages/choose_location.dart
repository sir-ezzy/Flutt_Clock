import 'package:flutter/material.dart';
import 'package:flutt/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClock> locational = [
    WorldClock(url: 'Africa/Lagos',location: 'Lagos',flag: 'Nigeria_flag.png'),
    WorldClock(url: 'Africa/Accra',location: 'Accra',flag: 'Ghana_flag.png'),
    WorldClock(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'Kenya_flag.png'),
    WorldClock(url: 'America/New_York',location: 'New_York',flag: 'United_States_flag.png'),
    WorldClock(url: 'Asia/Dubai',location: 'Dubai',flag: 'United_Arab_Emirates_flag.png'),
    WorldClock(url: 'Asia/Hong_Kong',location: 'Hong_Kong',flag: 'China_flag.png'),
    WorldClock(url: 'Asia/Jerusalem',location: 'Jerusalem',flag: 'Israel_flag.png'),
    WorldClock(url: 'Asia/Qatar',location: 'Qatar',flag: 'United_Arab_Emirates_flag.png'),
    WorldClock(url: 'Europe/Berlin',location: 'Berlin',flag: 'Germany_flag.png'),
    WorldClock(url: 'Europe/Dublin',location: 'Dublin',flag: 'United_Kingdom_flag.png'),
    WorldClock(url: 'Europe/London',location: 'London',flag: 'United_Kingdom_flag.png')
  ];

  void updateTime(index) async{

    WorldClock instances = locational[index];
    await instances.getTime();

    Navigator.pop(context,{
      'location': instances.location,
      'flag': instances.flag,
      'time': instances.time,
      'isdaytime': instances.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locational.length,
          itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locational[index].location),
              leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locational[index].flag}'),
              ),
            ),

          );
        }
      )
    );
  }
}
