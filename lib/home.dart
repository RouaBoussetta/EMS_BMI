import 'package:ems_bmi/result.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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


            Expanded(
            child: Row(
              children: [
                m2Expanded(context,'weight'),
                const SizedBox(
                  width: 10,
                ),
                m2Expanded(context,'age'),
              ],
            ),
          ),
            
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height/16,
              child: TextButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder:(context){
return Result(result: 24.33, isMale: isMale, age: age);
                })
                );
              }, child:   Text('Calculate',style: Theme.of(context).textTheme.headline2,)))
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
              Icon(type=='male'? Icons.male : Icons.female, size: 90,),
              const SizedBox(height: 10),
              Text(
                type=='male'? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              ), 
         
            ],
          ),
        ),
      ),
    );
  }

  m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
              type=='age'? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 10),
            Text(
              type=='age'? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline2,
            ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type=='age'?'age --' : 'weight --',
                    onPressed: (){
                          setState(() {
                       type=='age'? age -- : weight--;
                      });
                    },
                    child:
                     const Icon(Icons.remove),
                     mini: true,
                     ),
                  FloatingActionButton(
                    heroTag:type=='age'?'age ++' : 'weight ++' ,
                    onPressed: (){
                      setState(() {
                       type=='age'? age ++ : weight++;
                      });
                    },
                    child: 
                    const Icon(Icons.add),
                    mini: true,
                    ),
                ],
              )
          ],
        ),
      ),
    );


  }
}
