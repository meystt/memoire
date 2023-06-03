import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/screens/login/signIn.dart';
import 'package:health_and_doctor_appointment/screens/login/signup.dart';

class FireBaseAuth extends StatefulWidget {
  @override
  _FireBaseAuthState createState() => _FireBaseAuthState();

  // void out2(BuildContext context) {
  //   Navigator.pop(context);
  // }
}

class _FireBaseAuthState extends State<FireBaseAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/image-medical.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.black26.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () => _pushPage(context, SignIn()),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.blue,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              child: Text(
                                "Create an Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () => _pushPage(context, Register()),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.blue,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 1.1,
                        //   child: ButtonTheme(
                        //     minWidth: double.infinity,
                        //     height: 50.0,
                        //     child: RaisedButton(
                        //       color: Colors.indigo[800],
                        //       child: Text(
                        //         "Create an account",
                        //         style: GoogleFonts.lato(
                        //           color: Colors.white,
                        //           fontSize: 18.0,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       onPressed: () => _pushPage(context, Register()),
                        //     ),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(25),
                        //     ),
                        //   ),
                        //   padding: const EdgeInsets.all(16),
                        //   alignment: Alignment.center,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ), //<--
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
