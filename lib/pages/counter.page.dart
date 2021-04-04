import 'package:flutter/material.dart';
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),),
      floatingActionButton: Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         FloatingActionButton(
           onPressed: (){
             setState(() {
               --counter;
             });
           },
           child: Icon(Icons.remove),
     ),
         SizedBox(width: 10,),
         FloatingActionButton(
           onPressed: (){
             setState(() {
               ++counter;
             });
           },
           child: Icon(Icons.add),
         ),
       ],
     ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter value: $counter",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
