import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Game Dice",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trò chơi lớn nhỏ'),
        ),
        body: Center(
          child: _buildConten(),
        ),
      ),
    );
  }
}

class _buildConten extends StatefulWidget {
  const _buildConten({Key? key}) : super(key: key);

  @override
  __buildContenState createState() => __buildContenState();
}

class __buildContenState extends State<_buildConten> {
  String _textTitel = '';
  int _dice = 0;

  @override
  void initState() {
    // TODO: implement initState
    _textTitel = 'Vui lòng chọn lớn / nhỏ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [Image.asset('images/dice$_dice.png')],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(_textTitel),
                ElevatedButton(
                  onPressed: btnTai,
                  child: Text('Chọn tài'),
                ),
                ElevatedButton(onPressed: btnXiu, child: Text('Chọn xỉu')),
                ElevatedButton(onPressed: btnReset, child: Text('reset')),
              ],
            ))
      ],
    );
  }

  void btnTai() {
    setState(() {
      updateDice();
      if (_dice > 4) {
        _textTitel = 'Bạn thắng';
      } else {
        _textTitel = 'Bạn thua';
      }
    });
  }

  void btnXiu() {
    setState(() {
      updateDice();
      if (_dice < 4) {
        _textTitel = 'Bạn thắng';
      } else {
        _textTitel = 'Bạn thua';
      }
    });
  }

  void btnReset() {
    setState(() {
      _dice = 0;
      _textTitel = 'Vui lòng chọn lớn / nhỏ';
    });
  }

  void updateDice() {
    setState(() {
      _dice = Random().nextInt(6) + 1;
    });
  }
}
