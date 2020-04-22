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

  double _billAmount;
  int _tipPercentage;
  double _tip;
  double _total;
  final _tipController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    _billAmount = 0;
    _tipPercentage = 15;
    _tip = 0;
    _total = 0;
    _tipController.text = _tipPercentage.toString();
    _amountController.text = _billAmount.toString();

    super.initState();
  }

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
                Text("What is your bill amount: "),
                Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      onChanged: (text) {

                        _billAmount = double.parse(text);

                        setState(() {
                          _tip = _billAmount * (_tipPercentage/100);
                          _total = _tip + _billAmount;
                        });
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("What is the tip percentage: "),
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
                Text("Your tip is: $_tip")
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("Your total is: $_total")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
