import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import '../Global.dart';
import 'checker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Box friendBox;
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  final TextEditingController _send = TextEditingController();
  final TextEditingController _recieve = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendBox = Hive.box("Storage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("home"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: friendBox.listenable(),
                    builder: (context, Box friend, _) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final key = friend.keys.toList()[index];
                          final value = friend.get(key);
                          return ListTile(
                            leading: Icon(Icons.update),
                            title: Text(
                              "$key",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "Details in this form is hidden\nOpen with Master Key"),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                print(key);
                                gettingIn=true;
                                if(deletingValue==true)
                                {
                                  print(gettingIn.toString());
                                  friendBox.delete(key);}
                                Navigator.pushNamed(context,'/checker');
                                
                              },
                            ),

                            onTap:(){
                              val=friend.get(key);
                              Navigator.pushNamed(context,'/checker');

                            } ,

                          );
                        },
                        itemCount: friend.keys.toList().length,
                        separatorBuilder: (_, index) => Divider(),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            _value();
          }),
    );
  }

  Future<dynamic> _value() {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              height: 400,
              width: 50,
              color: Colors.grey[200],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Website'),
                        controller: _websiteController,
                      ),
                      SizedBox(height:20),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Login'),
                        controller: _mailController,
                      ),
                      SizedBox(height:20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                        controller: _passwordController,
                      ),
                      SizedBox(height:20),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Re-enter Password'),
                        controller: _repasswordController,
                      ),
                      SizedBox(height:40),
                      RaisedButton(
                          onPressed: () {
                            if (_passwordController.text ==
                                _repasswordController.text) {
                              friendBox.put(_websiteController.text, [
                                _websiteController.text,
                                _mailController.text,
                                _passwordController.text
                              ]);
                              Navigator.of(context).pop(true);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "re-Enter the correct password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black38,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Text("Add")),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
