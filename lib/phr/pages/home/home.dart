import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import 'blood_pressure_info_widget.dart';
import 'bmi_info_widget.dart';
import 'glucose_info_widget.dart';
import 'menu_widget.dart';


class PhrHomePage extends StatefulWidget {
  const PhrHomePage({Key key}) : super(key: key);

  @override
  State<PhrHomePage> createState() => _PhrHomePageState();
}

class _PhrHomePageState extends State<PhrHomePage> {
  final AppController appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    // set orientation
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    // load profile settings
    appController.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "Personal Health Record",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // your info
              //YourInfoWidget(),
              SizedBox(height: 8.0),

              // menu pane
              MenuWidget(),

              // bmi info
              BmiInfoWidget(),

              // blood pressure info
              BloodPressureWidget(),

              // blood glucose info
              GlucoseInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
