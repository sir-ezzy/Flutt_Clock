import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data = {};
  @override
  Widget build(BuildContext context) {

     if (data.isNotEmpty) {
       data = data;
     } else {
       data = ModalRoute.of(context)!.settings.arguments as Map;
     }
     print(data);

     String bg = (data['isdaytime']? 'day.png' : 'night.png');
     Color backgrund = (data['isdaytime']? Colors.green : Colors.indigo);

    return Scaffold(
      backgroundColor: backgrund,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location': result['location'],
                         'flag': result['flag'],
                         'isdaytime': result['isdaytime']
                       };
                     });
                    },
                    icon: Icon(
                        Icons.edit_location,
                    ),
                    label: Text(
                      'Choose locations',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                ),
                const SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}

