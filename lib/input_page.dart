import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'loading_screen.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({this.covidData});

  final covidData;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var currentCountry;
  int totalCases;
  int newCases;
  int activeCases;
  int totalDeaths;
  int totalRecovered;
  String country;

  @override
  void initState() {
    super.initState();
    updateUI(widget.covidData);
  }

  void updateUI(dynamic covidData) {
    totalCases = covidData['cases'];
    newCases = covidData['todayCases'];
    activeCases = covidData['active'];
    totalDeaths = covidData['deaths'];
    totalRecovered = covidData['recovered'];
    country = covidData['country'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COVID-19 $country'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoadingScreen(
                      country: widget.covidData['country'],
                    );
                  }));
                },
                child: Icon(Icons.refresh),
              )),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
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
                          'New Cases',
                          style: kLabelTextStyle.copyWith(color: Colors.red),
                        ),
                        Text(
                          newCases.toString(),
                          style: kContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
                  'Active Cases',
                  style: kLabelTextStyle.copyWith(color: Colors.red.shade900),
                ),
                Text(
                  activeCases.toString(),
                  style: kContainerTextStyle,
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Total Deaths',
                          style: kLabelTextStyle.copyWith(color: Colors.red),
                        ),
                        Text(
                          totalDeaths.toString(),
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
                          totalRecovered.toString(),
                          style: kContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
