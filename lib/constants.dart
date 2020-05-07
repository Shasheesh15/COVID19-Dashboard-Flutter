import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF424242);
const kInkActiveCardColour = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);
const kLabelTextStyle = TextStyle(
    color: Color(0xFF8D8E98), fontSize: 18.0, fontWeight: FontWeight.bold);
const kContainerTextStyle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kLargeButtonTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(fontSize: 100, fontWeight: FontWeight.bold);
const kBodyTextStyle = TextStyle(fontSize: 22.0);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter Country Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
