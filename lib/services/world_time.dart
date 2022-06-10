import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {

  String flag;
  String location;
  String url;
  String time = '';
  bool isdaytime = true;

  WorldClock({required this.flag,required this.location,required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isdaytime = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);

    }catch(e){
      print('Error occurred:$e');
    }

  }

}