import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color matching game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
  int _r = 0;
  int _g = 0;
  int _b = 0;
  bool _showResult;
  List<int> _color;

  List<int> createColor() {
    return List.generate(3, (i) => 85 * Random().nextInt(3));
  }

  String maxColorLabel() {
    List colorLabel = ["Red", "Green", "Blue", "Multiple"];
    int maxValue = _color.reduce((curr, next) => max(curr, next));
    if (_color.where((value) => maxValue == value).length > 1) {
      return colorLabel[3];
    }
    return colorLabel[_color.indexWhere((value) => maxValue == value)];
  }

  int addColorValue(int value) {
    return value == 255 ? 0 : value + 85;
  }

  void clearState() {
    setState(() {
      _color = createColor();
      _r = 0;
      _g = 0;
      _b = 0;
      _showResult = false;
    });
  }

  @override
  void initState() {
    super.initState();
    clearState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Matching Game'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Theme color",
          ),
          SizedBox(height: 10.0),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(_color[0], _color[1], _color[2], 1.0),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "The biggest one is ${maxColorLabel()}",
            style: TextStyle(
                color: Color.fromRGBO(_color[0], _color[1], _color[2], 1.0)),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _r = addColorValue(_r);
                  });
                },
                color: Color.fromRGBO(_r, 0, 0, 1),
                textColor: Colors.white,
                child: Text(
                  "RED",
                ),
              ),
              SizedBox(width: 10.0),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _g = addColorValue(_g);
                  });
                },
                color: Color.fromRGBO(0, _g, 0, 1),
                textColor: Colors.white,
                child: Text(
                  "GREEN",
                ),
              ),
              SizedBox(width: 10.0),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _b = addColorValue(_b);
                  });
                },
                color: Color.fromRGBO(0, 0, _b, 1),
                textColor: Colors.white,
                child: Text(
                  "BLUE",
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          _showResult
              ? Column(
                  children: <Widget>[
                    Text(
                      "Your color",
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(_r, _g, _b, 1.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _r == _color[0] && _g == _color[1] && _b == _color[2]
                          ? "Match!"
                          : "Not Match",
                      style: TextStyle(color: Color.fromRGBO(_r, _g, _b, 1.0)),
                    ),
                  ],
                )
              : Container(),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {
              if (_showResult) {
                clearState();
              } else {
                setState(() {
                  _showResult = true;
                });
              }
            },
            child: Text(
              _showResult ? "NEXT COLOR" : "SHOW RESULT",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      )),
    );
  }
}
