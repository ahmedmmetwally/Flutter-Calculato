import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(NewCalculator());

class NewCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'hello',
      home: new Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '0';
  String finalResult = '0';
  String opr = "";
  String preOpr = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: null,
      ),
      body: new Container(
        margin: EdgeInsets.only(bottom: 20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                    child: new Text(
                      text,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildContainer("C", Colors.grey),
                buildContainer("+/-", Colors.grey),
                buildContainer("%", Colors.grey),
                buildContainer("/", Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildContainer("7", Colors.brown),
                buildContainer("8", Colors.brown),
                buildContainer("9", Colors.brown),
                buildContainer("X", Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildContainer("4", Colors.brown),
                buildContainer("5", Colors.brown),
                buildContainer("6", Colors.brown),
                buildContainer("-", Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildContainer("1", Colors.brown),
                buildContainer("2", Colors.brown),
                buildContainer("3", Colors.brown),
                buildContainer("+", Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: RaisedButton(
                        onPressed: () {
                          calculate('0');
                        },
                        child: new Text(
                          '0',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.only(
                            left: 81, right: 81, top: 20, bottom: 20),
                        color: Colors.brown)),
                buildContainer(".", Colors.brown),
                buildContainer("=", Colors.amber)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(String textBtn, Color color) {
    return new Container(
        margin: EdgeInsets.only(bottom: 20),
        child: RaisedButton(
            onPressed: () {
              calculate(textBtn);
            },
            child: new Text(
              textBtn,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            color: color));
  }

  void calculate(textBtn) {
    if (textBtn == "C") {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = "";
      preOpr = "";
   }
    else if (opr == '=' && textBtn == "=") {
      switch (preOpr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case '*':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
    }
    else if (textBtn == '+' ||
        textBtn == '-' ||
        textBtn == '*' ||
        textBtn == '/' ||
        textBtn == '=') {
      if (numOne == 0)
        numOne = double.parse(result);
      else
        numTwo = double.parse(result);
      switch (opr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case '*':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
      preOpr = opr;
      opr = textBtn;
      result = '';
    } else {
      if (result == "0")
        result = textBtn;
      else
        result = result + textBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
