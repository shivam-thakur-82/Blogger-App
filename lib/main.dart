import 'read_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {
      'home' : (context) => Home(),
      'readData' : (context) => ReadData(),
      //'contentData' : (context) => ContentData(),
    },
  ));
}
