import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:health_and_doctor_appointment/phr/controllers/app_controller.dart';
import 'package:health_and_doctor_appointment/phr/models/settings.dart';
import 'package:health_and_doctor_appointment/screens/doctorProfile.dart';
import 'package:health_and_doctor_appointment/screens/login/firebaseAuth.dart';
import 'package:health_and_doctor_appointment/mainPage.dart';
import 'package:health_and_doctor_appointment/screens/myAppointments.dart';
import 'package:health_and_doctor_appointment/screens/onbroarding/onboarding_screen.dart';
import 'package:health_and_doctor_appointment/screens/userProfile.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

//import 'chatListDedmo.dart';

Future<void> main() async {

  await Hive.initFlutter();
  // register adaptor
  Hive.registerAdapter(SettingsAdapter());
  // open setting box
  //final boxSettings = await Hive.openBox<Settings>('Settings');


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final AppController appController = Get.put(AppController());


  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  Future<void> _getUser() async {
    user = _auth.currentUser ;
  }

  @override
  Widget build(BuildContext context) {
    _getUser();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => user == null ? OnboardingScreen() : MainPage()  ,
        '/login': (context) => FireBaseAuth(),
        '/home': (context) => MainPage(),
        '/profile': (context) => UserProfile(),
        '/MyAppointments': (context) => MyAppointments(),
        '/DoctorProfile': (context) => DoctorProfile(),
      },
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      //home: FirebaseAuthDemo(),
    );
  }

}
