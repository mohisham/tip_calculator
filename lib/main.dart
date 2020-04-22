import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("What is your bill amount: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54)),
                Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField()
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("What is the tip percentage: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54)),
                Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField()
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("Your tip is: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54))
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("Your total is: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
