import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  // location name for UI
  late String location;
  // the time in the location
  String? time;
  // url to flag icon
  late String flag;
  // url for api end point
  late String url;
  // true or false if day or night
  bool isDaytime;

// how to create a constructor think
// name will be same as class
  WorldTime(
      {required this.isDaytime,
      required this.location,
      required this.flag,
      required this.url});

  Future<void> getTime() async {
    try {
      // make the req
      var myUrl = Uri.parse("http://worldtimeapi.org/api/timezone$url");
      Response response = await get(myUrl);
      Map data = jsonDecode(response.body);
      // extracting data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);
      // creating a DateTime object
      DateTime now = DateTime.parse(dateTime);
      // converted string to number int.parse
      now = now.add(Duration(hours: int.parse(offSet)));
      print(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      print(isDaytime);
      // set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Get time catch block $e");
    }
  }
}

// create an instance of class

