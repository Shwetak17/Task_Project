import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ColorMixer()
    )
);

class ColorMixer extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ColorMixer> {
  double red =255.0;
  double green =255.0;
  double blue = 255.0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(red.round(), green.round(), blue.round(),1),
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.white60,
        title: Center(child: Text('Color Mixer',style:TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black))),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: InkWell(
          onTap: (){
            setState(() {
              var random = Random();
              var r = random.nextInt(255);
              var g = random.nextInt(255);
              var b = random.nextInt(255);
              red = r.roundToDouble();
              green = g.roundToDouble();
              blue = b.roundToDouble();
            });
          },
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 5,),
                  Text('Red',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                  SizedBox(width: 25,),
                  Container(
                    width: 290.0,
                    child: Slider.adaptive(
                      value: red,
                      activeColor: Colors.red,
                      onChanged: (value){
                        setState(() {
                          red=value;
                        });
                      },
                      min: 0,
                      max: 255,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  SizedBox(width: 2,),
                  Text('Blue',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                  SizedBox(width: 22,),
                  Container(
                    width: 290,
                    child: Slider.adaptive(
                      value: blue,
                      activeColor: Colors.blue,
                      onChanged: (value){
                        setState(() {
                          blue=value;
                        });
                      },
                      min: 0,
                      max: 255,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  SizedBox(width: 1,),
                  Text('Green',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                  SizedBox(width: 5,),
                  Container(
                    width: 290.0,
                    child: Slider.adaptive(
                      value: green,
                      activeColor: Colors.green,
                      onChanged: (value){
                        setState(() {
                          green=value;
                        });
                      },
                      min: 0,
                      max: 255,
                    ),
                  ),
                ],
              ),
            ],),
        ),
      ),

    );
  }
}

