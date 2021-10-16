import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            m1Expanded(context,'male'),
            const SizedBox(
              width: 10,
            ),
            m1Expanded(context,'female'),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context , String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type=='male'? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (isMale && type=='male')||(!isMale && type=='female') ? Colors.teal : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type=='male'? Icons.male : Icons.female),
              const SizedBox(height: 15),
              Text(
                type=='male'? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
