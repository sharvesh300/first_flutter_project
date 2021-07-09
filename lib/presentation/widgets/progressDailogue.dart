import 'package:flutter/material.dart';

class ProgressDailogue extends StatelessWidget {
  const ProgressDailogue({Key? key,required this.msg}) : super(key: key);
final String msg;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow,
      child:Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children:[
              SizedBox(width:6.0),
              CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.black) ,),
              SizedBox(width:26),
              Text(msg,style: TextStyle(color:Colors.black),)
            ]
          ),
        )
      )
    );
  }
}
