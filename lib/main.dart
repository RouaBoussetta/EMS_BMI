import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.black,
              textTheme: const TextTheme(
headline2:  TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              
              color: Colors.white)
                )
              ),

      
      home:   const Result(
        age: 22,
       isMale: true,
        result: 50),
    );
  }
}
