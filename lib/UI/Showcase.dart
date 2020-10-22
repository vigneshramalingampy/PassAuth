import 'package:flutter/material.dart';
import '../Global.dart';


class Showcase extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Text(val[0])),
      backgroundColor: Colors.green,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
        child: Column(
        
          children: [
            cont(0,'Website:'),
            SizedBox(height:10),
            cont(1,'Login Id:'),
            SizedBox(height:10),
            cont(2,'Password:'),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
  Widget cont(number,tag)
  {
    return Container(
              margin: EdgeInsets.only(top:10,bottom: 10),
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text(tag,style: TextStyle(color: Colors.green[200],fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(val[number],style: TextStyle(color: Colors.black38,fontSize: 25,fontWeight: FontWeight.bold),),
                  
                ],
              ),
            );
  }
}