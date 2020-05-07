import 'package:covid19/worldwide.dart';
import 'package:flutter/material.dart';
import 'networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen2 extends StatefulWidget {
  LoadingScreen2();
  @override
  _LoadingScreen2 createState() => _LoadingScreen2();
}

class _LoadingScreen2 extends State<LoadingScreen2> {
  int flag = 0;
  @override
  void initState() {
    super.initState();
    getCountryData();
  }

  void getCountryData() async {
    NetworkHelper2 networkHelper = NetworkHelper2();

    var worldData = await networkHelper.getData();

//    print(covidData);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WorldWide(
        worldData: worldData,
      );
    }));
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
