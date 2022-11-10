// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      isDaytime: true,
      location: 'London',
      flag: 'london.jpg',
      url: 'Europe/London',
    ),
    WorldTime(
      isDaytime: true,
      location: 'Karachi',
      flag: 'karachi.jpg',
      url: 'Asia/Karachi',
    ),
    WorldTime(
      isDaytime: true,
      location: 'Chicago',
      flag: 'chicago.png',
      url: 'America/Chicago',
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(locations[index].flag),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
