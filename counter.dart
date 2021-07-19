import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: OrderPage(),
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isShowing = true;
  Widget blueCounter,redCounter;
  
  @override
  void initState(){
    super.initState();
    blueCounter = CounterButton(color: Colors.blue);
    redCounter = CounterButton(color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: (Text('Delete blue')),
          onPressed: () {
            setState(() {
              isShowing = false;
            });
          },
        ),
        if (isShowing) blueCounter,
        redCounter,
      ],
    );
  }
}

class CounterButton extends StatefulWidget {
  final Color color;

  CounterButton({this.color}) : super();

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: (Text('$count')),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => widget.color),
      ),
      onPressed: () {
        setState(() {
          count++;
        });
      },
    );
  }
}
