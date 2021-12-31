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
  double _tien = 50000;
  int _luoc = 10000;

  @override
  void initState() {
    // TODO: implement initState
    _textTitel = 'Vui lòng chọn lớn / nhỏ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                if (_tien >= _luoc)
                  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: (_width - 200) / 2),
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ButtonTheme(
                                      minWidth: 88.0,
                                      height: 100.0,
                                      child: ElevatedButton(
                                        onPressed: btnTai,
                                        child: Text("chọn tài"),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ButtonTheme(
                                      minWidth: 88.0,
                                      height: 100.0,
                                      child: ElevatedButton(
                                        onPressed: btnXiu,
                                        child: Text("chọn xỉu"),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                      ElevatedButton(onPressed: btnReset, child: Text('reset')),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(_tien.toString() + ' đồng'),
                ),
              ],
            ))
      ],
    );
  }

  void btnTai() {
    setState(() {
      updateDice();
      if (_dice > 4) {
        thang();
      } else {
        thua();
      }
    });
  }

  void btnXiu() {
    setState(() {
      updateDice();
      if (_dice < 4) {
        thang();
      } else {
        thua();
      }
    });
  }

  void thang() {
    _textTitel = 'Bạn thắng';
    _tien = _tien + _luoc;
  }

  void thua() {
    _textTitel = 'Bạn thua';
    _tien = _tien - _luoc;
  }

  void btnReset() {
    setState(() {
      _dice = 0;
      _tien = 50000;
      _textTitel = 'Vui lòng chọn lớn / nhỏ';
    });
  }

  void updateDice() {
    setState(() {
      _dice = Random().nextInt(6) + 1;
    });
  }
}
