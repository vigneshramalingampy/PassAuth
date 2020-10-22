import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Global.dart';


class Checker extends StatelessWidget {
  Box friendBox;
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
                    Text("Enter Master Key ",style: TextStyle(color:Colors.green,fontSize: 20),),
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
                                  if(gettingIn==true)
                                  {
                                    gettingIn=false;
                                    check='fhhg';
                                    deletingValue=true;
                                    Navigator.pop(context);
                                    
                                  }
                                  else
                                  {Navigator.pushNamed(context, '/showcase');}
                                }
                                else
                                {
                                  Fluttertoast.showToast(
                                  msg: "Wrong MasterKey",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black38,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
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
