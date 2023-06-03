// blood pressure type
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_and_doctor_appointment/phr/pages/bloodpressure/blood_pressure.dart';
import 'package:health_and_doctor_appointment/phr/pages/bmi/bmi.dart';
import 'package:health_and_doctor_appointment/phr/pages/glucose/gluecose.dart';
import 'package:hive/hive.dart';

import 'models/bloodpressure_typeitem.dart';
import 'models/menu.dart';
import 'models/settings.dart';



final List<TypeItem> bloodPressureTypeList = [
  TypeItem(Colors.lightBlue, "Hypotension", "< 90", "< 60"),
  TypeItem(Colors.green, "Normal", "91-120", "61-80"),
  TypeItem(Colors.amber, "Pre-Hypertension", "121-140", "81-90"),
  TypeItem(Colors.orange, "Stage 1 Hypertension", "141-160", "91-100"),
  TypeItem(Colors.red, "Stage 2 Hypertension", "> 160", "> 100"),
];

final bloodPressureTypeLabel = [
  "Hypotension",
  "Normal",
  "Pre-Hypertension",
  "Stage 1 Hypertension",
  "Stage 2 Hypertension",
];

final bloodPressureTypeGraphLabel = [
  "Hypo",
  "Normal",
  "Pre",
  "Stage 1",
  "Stage 2",
];

final bmiTypeLabel = [
  "Underweight",
  "Normal weight",
  "Overweight",
  "Obesity",
];

final glucoseTypeLabel = [
  "Normal",
  "Impaired Glucose",
  "Diabetic",
  "Unknow",
];

final glucoseWhenLabel = [
  "Fasting",
  "After Eating",
  "2-3 Hrs After Eating",
];

final mainMenu = [
  Menu(
    "Body Mass Index",
    FontAwesomeIcons.weightScale,
    listColor[1],
    const BmiPage(),
  ),
  Menu(
    "Blood Pressure",
    FontAwesomeIcons.heartPulse,
    listColor[2],
    const BloodPressurePage(),
  ),
  Menu(
    "Blood Glucose",
    FontAwesomeIcons.candyCane,
    listColor[4],
    const GlucosePage(),
  ),
];



const List<Color> listBmiColor = [
  Colors.lightBlue,
  Colors.green,
  Colors.orange,
  Colors.red,
];

const List<Color> listBloodPressureColor = [
  Colors.lightBlue,
  Colors.green,
  Colors.amber,
  Colors.orange,
  Colors.red,
];

const List<Color> listGlucoseColor = [
  Colors.green,
  Colors.amber,
  Colors.red,
  Colors.grey,
];

const List<Color> listColor = [
  Colors.lightBlue,
  Colors.green,
  Colors.amber,
  Colors.orange,
  Colors.red,
];

const List<Color> listChartColor = [
  Colors.red,
  Colors.orange,
  Colors.green,
];
