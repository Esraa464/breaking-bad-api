import 'package:flutter/material.dart';
import 'package:untitled/home_page/view.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
