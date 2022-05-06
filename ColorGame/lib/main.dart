import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(HexPickerPage());

class HexPickerPage extends StatefulWidget {
  @override
  HexPickerPageState createState() => new HexPickerPageState();
}

class HexPickerPageState extends State<HexPickerPage> {
  bool state = true;
  HSVColor color = new HSVColor.fromColor(Colors.blue);
  void onChanged(HSVColor value) => this.color = value;
  var rng = new Random();
  Color randomColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Random Color Game'),
                ),
                body: new Column(children: <Widget>[
                  state
                      ? Builder(
                          builder: (context) => RaisedButton(
                              onPressed: () {
                                newGame();
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new ColorRoute(
                                          background: randomColor)),
                                );
                              },
                              child: Text(
                                  "                         New Game                         "),
                              textTheme: ButtonTextTheme.primary,
                              color: randomColor))
                      : Container(),
                  !(state)
                      ? Builder(
                          builder: (context) => RaisedButton(
                                onPressed: () {
                                  verify();
                                },
                                child: Text(
                                    "                             Verify                             "),
                              ))
                      : Container(),
                  new Divider(),
                  new Center(
                      child: new Container(
                          width: 260,
                          child: new Card(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0))),
                              elevation: 2.0,
                              child: new Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: new Column(
                                      //mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                            width: 90.0,
                                            height: 90.0,
                                            child: new FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor:
                                                  this.color.toColor(),
                                            )),
                                        new Divider(),

                                        ///---------------------------------
                                        new PaletteSaturationPicker(
                                          color: this.color,
                                          onChanged: (value) => super.setState(
                                              () => this.onChanged(value)),
                                        )

                                        ///---------------------------------
                                      ]))))),
                ]))));
  }

  newGame() {
    setState(() {
      randomColor = new Color.fromRGBO(
          rng.nextInt(256), rng.nextInt(256), rng.nextInt(256), 1.0);
      state = false;
    });
  }

  verify() {
    int c1r = color.toColor().red;
    int c1g = color.toColor().green;
    int c1b = color.toColor().blue;

    int c2r = randomColor.red;
    int c2g = randomColor.green;
    int c2b = randomColor.blue;

    double rmean = (c1r + c2r) / 2;
    int r = c1r - c2r;
    int g = c1g - c2g;
    int b = c1b - c2b;
    double weightR = 2 + rmean / 256;
    double weightG = 4.0;
    double weightB = 2 + (255 - rmean) / 256;
    double score = sqrt(weightR * r.toDouble() * r.toDouble() +
        weightG * g.toDouble() * g.toDouble() +
        weightB * b.toDouble() * b.toDouble());
    Fluttertoast.showToast(
        msg: ("Score : " + score.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 20.0);
    setState(() {
      state = true;
    });
  }
}

class ColorRoute extends StatelessWidget {
  final Color background;

  ColorRoute({Key key, @required this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Keep in mind this color"),
        ),
        body: new Container(
          decoration: new BoxDecoration(color: background),
        ));
  }
}
