import 'package:PassAuth/Global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
class MasterPassword extends StatefulWidget {
  @override
  _MasterPasswordState createState() => _MasterPasswordState();
}

class _MasterPasswordState extends State<MasterPassword> {
  final _formkey = GlobalKey<FormState>();
  String value,summa;
  TextEditingController _masterkeynumber=TextEditingController();
  FocusNode _usernameFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getValue();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 50),
              child: Container(
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[900],
                      offset: Offset(0, 3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 30, color: Colors.green),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: 'Login'),
                          
                            validator: (text) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                              RegExp regex = new RegExp(pattern);
                             if(text.length==0)
                             {
                               return 'text field empty';
                             }
                             else if (!regex.hasMatch(text))
                                return 'Enter Valid Email\n\nex:xoxo@hotmail.com';
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'password'),
                                onChanged: (text){value=text;},
                            validator: (text) {
                              Pattern pattern =
                                  r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                              RegExp regex = new RegExp(pattern);
                              if(text.length==0)
                             {
                               return 'text field empty';
                             }
                             else if (!regex.hasMatch(text))
                                return 'Use more than 6 character\nSet alpha numeric as password';
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Master key Generation'),
                                keyboardType: TextInputType.number,
                               controller: _masterkeynumber,
                          ) ,
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () async{
                          print("$value");
                          SharedPreferences prefs=await SharedPreferences.getInstance();
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                             _setValue(true);
                             prefs.setString("masterKey", _masterkeynumber.text);
                             
                             Navigator.pushNamed(context, '/masterPage');
                             
                          }
                        },
                        child: Text('login'),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
 _setValue(bool val) async
 {
   SharedPreferences prefs=await SharedPreferences.getInstance();
   
   prefs.setBool('loginValue', val);
 }
 _getValue () async
 {
   SharedPreferences prefs=await SharedPreferences.getInstance();
    summa=prefs.getString('masterKey');
    print("$summa");
 }
}
