import 'dart:io';

import 'package:PassAuth/UI/checker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'UI/MasterPassword.dart';
import "UI/Home.dart";
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'UI/MasterPage.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/Showcase.dart';
import 'UI/checker.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory document= await getApplicationDocumentsDirectory();

  Hive.init(document.path);
  await Hive.openBox("Storage");
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setBool('loginValue',false);
  bool login =prefs.getBool('loginValue');
  runApp(
    MaterialApp(
    home: ((login==false|| login==null)?MasterPassword():MasterPage()),
  routes: {
    '/login': (context) => MasterPassword(),
    '/masterPage': (context) => MasterPage(),
    '/home':(context)=>Home(),
    '/checker':(context)=>Checker(),
    '/showcase':(context)=>Showcase(),
  },)
    );
}

