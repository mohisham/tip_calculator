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
                Text("What is your bill amount: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54)),
                Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
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
                Text("What is the tip percentage: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black54)),
                Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _tipController,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        _tipPercentage = int.parse(text);
                        setState(() {
                          _tip = _billAmount * (_tipPercentage/100);
                          _total = _tip + _billAmount;
                        });
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.grey.shade300,
                  child: Text("10%"),
                  onPressed: () {
                    _tipController.text = "10";
                    setState(() {
                      _tipPercentage = 10;
                      _tip = _billAmount * (_tipPercentage/100);
                      _total = _tip + _billAmount;
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.grey.shade300,
                  child: Text("18%"),
                  onPressed: () {
                    _tipController.text = "18";
                    setState(() {
                      _tipPercentage = 18;
                      _tip = _billAmount * (_tipPercentage/100);
                      _total = _tip + _billAmount;
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.grey.shade300,
                  child: Text("20%"),
                  onPressed: () {
                    _tipController.text = "20";
                    setState(() {
                      _tipPercentage = 20;
                      _tip = _billAmount * (_tipPercentage/100);
                      _total = _tip + _billAmount;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Your tip is: \$${_tip.toStringAsFixed(2)}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black54))
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Text("Your total is: \$${_total.toStringAsFixed(2)}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black54))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
