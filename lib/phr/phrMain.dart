import 'package:auto_size_text/auto_size_text.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_and_doctor_appointment/phr/themes/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../screens/homePage.dart';
import 'const.dart';
import 'controllers/app_controller.dart';
import 'models/settings.dart';
import 'pages/home/home.dart';


class PhrMain extends StatefulWidget {
  const PhrMain({
    Key key,
  }) : super(key: key);

  @override
  State<PhrMain> createState() => _PhrMainState();
}



class _PhrMainState extends State<PhrMain> {
  final AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    // Add sample data
   appController.addSampleData();

    // clear sample data
    //appController.clearSampleData();

    // Load settingd
 //   appController.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
        return GetMaterialApp(
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child),
          debugShowCheckedModeBanner: false,
          title: 'Personal Health Record',
          // Check setting has data if not goto setting page
          home:  PhrHomePage(),
      );
  }
}
