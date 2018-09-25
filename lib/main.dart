import 'package:flutter/material.dart';
import 'package:aeoloader/Controller/SplashScreen.dart';
import 'package:aeoloader/Controller/hompage.dart';
import 'package:aeoloader/Model/Constant.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      title: 'Custom Loader',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => HomePage(),
        //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
      },
    );
  }
}

