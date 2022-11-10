import 'package:flutter/material.dart';
import 'package:world_time_app/pages/chooseLocation.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(
    MaterialApp(initialRoute: '/', routes: {
      // routing is here
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation()
    }),
  );
}
