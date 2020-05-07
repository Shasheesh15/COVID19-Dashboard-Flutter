import 'package:covid19/constants.dart';
import 'package:covid19/reusable_card.dart';
import 'package:flutter/material.dart';
import 'loading_screen2.dart';

class WorldWide extends StatefulWidget {
  WorldWide({this.worldData});
  final worldData;
  @override
  _WorldWideState createState() => _WorldWideState();
}

class _WorldWideState extends State<WorldWide> {
  int totalCases;
  int deaths;
  int recovered;

  @override
  void initState() {
    super.initState();
    updateUI(widget.worldData);
  }

  void updateUI(dynamic worldData) {
    totalCases = worldData['cases'];
    deaths = worldData['deaths'];
    recovered = worldData['recovered'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Covid-19 WorldWide'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoadingScreen2();
                    }));
                  },
                  child: Icon(Icons.refresh),
                )),
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Cases',
                        style: kLabelTextStyle.copyWith(color: Colors.red),
                      ),
                      Text(
                        totalCases.toString(),
                        style: kContainerTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Deaths',
                        style: kLabelTextStyle.copyWith(
                            color: Colors.red.shade900),
                      ),
                      Text(
                        deaths.toString(),
                        style: kContainerTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Recovered',
                        style: kLabelTextStyle.copyWith(color: Colors.green),
                      ),
                      Text(
                        recovered.toString(),
                        style: kContainerTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }
}
