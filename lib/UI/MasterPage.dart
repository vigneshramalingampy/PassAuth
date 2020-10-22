import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'checker.dart';
class MasterPage extends StatefulWidget {
  
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {

  TextEditingController _textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 100, right: 20, bottom: 100),
          child: Container(
            height: 550,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Text("Master Key",style: TextStyle(color:Colors.green,fontSize: 20),),
                    SizedBox(height: 50),
                    TextField(
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Master Key'),
                    controller: _textcontroller,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Container(
                        child:
                            FloatingActionButton(
                              
                            child: Icon(Icons.arrow_forward),
                            backgroundColor: Colors.green,


                            onPressed: () 
                            async{
                              SharedPreferences prefs=await SharedPreferences.getInstance();
                              print(prefs.getString("masterKey"));
                              print(_textcontroller.text);
                                if(_textcontroller.text==prefs.getString("masterKey"))
                                {
                                  Navigator.pushNamed(context, '/home');
                                }
                            },
                            
                            
                            ),
                            ),
                           
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
