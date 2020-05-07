import 'package:covid19/bottom_button.dart';
import 'package:covid19/constants.dart';
import 'package:covid19/know_more.dart';
import 'package:covid19/loading_screen.dart';
import 'package:flutter/material.dart';
import 'loading_screen2.dart';

class SelectScreen extends StatefulWidget {
  SelectScreen({this.worldWide});
  final worldWide;
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  var currentCountry;
  int totalCases;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen2();
                }));
              },
              child: Text(
                'COVID-19 Dashboard',
                style: kContainerTextStyle.copyWith(fontSize: 30),
              ),
              splashColor: Colors.transparent,
              highlightColor:
                  Colors.transparent, // makes highlight invisible too
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: kTextFieldInputDecoration.copyWith(),
                      onChanged: (value) {
                        currentCountry = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BottomButton(
                    buttonTitle: 'Get Stats',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoadingScreen(
                          country: currentCountry,
                        );
                      }));
                    },
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'Know More',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return KnowMore();
                }));
              },
            ),
          ],
        ),
      )),
    );
  }
}
