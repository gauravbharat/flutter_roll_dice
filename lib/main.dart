import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceeApp());
}

class DiceeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

// Use a stateful widget over a stateless one when there are user interactions involved which
// can alter the state of the widgets
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    // Tip: Variables should be inside build() method to work with hot-reloading

    return SafeArea(
      child: Center(
        child: Row(
          children: <Widget>[
            diceButton(leftDiceNumber),
            diceButton(rightDiceNumber),
          ],
        ),
      ),
    );
  }

  Widget diceButton(int diceNumber) {
    // Tip: Use Expanded widget instead of hardcoded width or height for the underlying child
    // widgets to take the available space available and evenly distributed among the child widgets
    return Expanded(
      child: FlatButton(
        onPressed: rollDice,
        child: Image.asset('images/dice$diceNumber.png'),
      ),
    );
  }

  void rollDice() {
    // Tip: Use setState() to modify the state of the changed widget
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
