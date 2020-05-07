import 'package:covid19/select_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'networking.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.country});
  final country;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int flag = 0;
  @override
  void initState() {
    super.initState();
    getCountryData(widget.country);
  }

  void getCountryData(String country) async {
    NetworkHelper networkHelper =
        NetworkHelper('https://corona.lmao.ninja/countries/$country');

    var covidData = await networkHelper.getData();

//    print(covidData);
    if (covidData != null) {
      flag = 1;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return InputPage(
          covidData: covidData,
        );
      }));
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Country Not Found",
        desc: "Check Your Spelling!",
        buttons: [
          DialogButton(
            child: Text(
              "CLOSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return SelectScreen();
              }));
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
