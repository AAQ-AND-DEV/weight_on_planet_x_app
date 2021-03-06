import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  /*
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
   */
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalWeight = 0.0;
  String _formattedText = "Your weight on ";
  void handleRadioValueChanged(int val) {
    setState(() {
      radioValue = val;
      switch (radioValue){
        case 0:
          _formattedText = "Your weight on ";
          _finalWeight = calculateWeight(_weightController.text, 0.06);
          _formattedText+= "Pluto is ${_finalWeight.toStringAsFixed(1)} lbs";
          break;
        case 1:
          _formattedText = "Your weight on ";
          _finalWeight =  calculateWeight(_weightController.text, 0.38);
          _formattedText+= "Mars is ${_finalWeight.toStringAsFixed(1)} lbs";
          break;
        case 2:
          _formattedText = "Your weight on ";
          _finalWeight = calculateWeight(_weightController.text, 0.91);
          _formattedText+= "Venus is ${_finalWeight.toStringAsFixed(1)} lbs";
          break;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weight on Planet X"),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container(
            alignment: Alignment.topCenter,
            child: new ListView(
              padding: const EdgeInsets.all(2.5),
              children: <Widget>[
                new Image.asset(
                  "images/planet.png",
                  height: 133.0,
                  width: 200.0,
                ),
                new Container(
                  margin: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: "your weight on Earth",
                          hintText: 'In Pounds',
                          icon: new Icon(Icons.person_outline),
                        ),
                      ),
                      new Padding(padding: new EdgeInsets.all(5.0)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                            activeColor: Colors.brown,
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Pluto",
                            style: new TextStyle(color: Colors.white30),
                          ),
                          new Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Mars",
                            style: new TextStyle(color: Colors.white30),
                          ),
                          new Radio<int>(
                            activeColor: Colors.orange,
                            value: 2,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Venus",
                            style: new TextStyle(color: Colors.white30),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: new Text(
                          _weightController.text.isEmpty? "Please enter weight" : _formattedText,
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));

  }
  double calculateWeight(String weight, double multiplier){
    double res = 0.0;
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      res = int.parse(weight)*multiplier;
    } else {
      print("Wrong!");
    }
    return res;
  }
}
