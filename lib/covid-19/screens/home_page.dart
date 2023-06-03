import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CovHomePage extends StatefulWidget {
  @override
  _CovHomePageState createState() => _CovHomePageState();
}

class _CovHomePageState extends State<CovHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //TODO: Add a drawer window
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "Covid-19",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: HomeCategories(),
    );
  }
}
