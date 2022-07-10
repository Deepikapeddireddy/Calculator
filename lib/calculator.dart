import 'dart:ui';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String sum = "0", result = "0", exp1 = "";
  double fontsize1 = 35, fontsize2 = 45;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(sum,
                style: TextStyle(color: Colors.white, fontSize: fontsize1)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(result,
                style: TextStyle(color: Colors.white, fontSize: fontsize2)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottom("AC", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("%", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("÷", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("Del", Colors.black, Color.fromRGBO(250, 168, 34, 1),
                  w * 0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottom("7", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("8", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("9", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom(
                  "x", Colors.black, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottom("4", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("5", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("6", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom(
                  "-", Colors.black, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottom("1", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("2", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom("3", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom(
                  "+", Colors.black, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottom("0", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.45),
              bottom(".", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),
                  w * 0.2),
              bottom(
                  "=", Colors.black, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottom(String text, Color fontcolor, Color _color, double w1) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (text == "=") {
          try {
            exp1 = sum;
            exp1 = exp1.replaceAll("x", "*");
            exp1 = exp1.replaceAll("÷", "/");
            Parser P = Parser();
            Expression exp2 = P.parse(exp1);
            ContextModel con = ContextModel();
            result = "${exp2.evaluate(EvaluationType.REAL, con)}";
            fontsize1 = 45;
            fontsize2 = 35;
            setState(() {});
          } catch (e) {
            fontsize1 = 45;
            fontsize2 = 35;
            result = "ERROR";
            setState(() {});
          }
          ;
        } else if (text == "AC") {
          sum = "0";
          result = "0";
          setState(() {});
        } else if (text == "Del") {
            fontsize1 = 45;
            fontsize2 = 35;
          if (sum.length == 1) {
            sum = "0";
            result = "0";
            setState(() {});
          } else {
            sum = sum.substring(0, sum.length - 1);
            setState(() {});
          }
        } else {
          if (sum == "0") {
            sum = text;
            setState(() {});
          } else {
            sum += text;
            setState(() {});
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        height: h * 0.09,
        width: w1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: _color,
        ),
        child: Text(
          text,
          style: TextStyle(color: fontcolor, fontSize: 30),
        ),
      ),
    );
  }
}
