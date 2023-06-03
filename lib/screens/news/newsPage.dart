import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "News",
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

      body: WillPopScope(

        onWillPop: ()async
        {
          if(await webViewController.canGoBack())
          {
            webViewController.goBack();
            return false;
          }else{
            return true;
          }
        },
        child: Stack(
            children:[
              WebView(
                initialUrl: "https://www.medicalnewstoday.com/",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController wc){
                  webViewController=wc;
                } ,
              )
            ]
        )  ,
      ),
    );
  }
}






