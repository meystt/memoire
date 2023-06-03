

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_and_doctor_appointment/DoctorChat.dart';

import 'model/chatCard.dart';

class chatListDemo extends StatefulWidget {
  const chatListDemo({Key key}) : super(key: key);

  @override
  State<chatListDemo> createState() => _chatListDemoState();
}

class _chatListDemoState extends State<chatListDemo> {
  @override
  Widget build(BuildContext context) {
    List list=[];
    return Scaffold(
    appBar: AppBar(
      title: Text("ChatList"),
    ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("doctors").snapshots(),
          builder: (context, snapshot) {

            switch(snapshot.connectionState)
            {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child:CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
            }

            final data = snapshot.data.docs;
           /* for (var i in data){

              list.add(DoctorChat.fromJson(i.map()));
            }*/
            list =data.map((e) => DoctorChat.fromJson(e.data())).toList() ??[];

            return ListView.builder(
              padding: EdgeInsets.only(top: 8),
              itemCount: list.length ,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
              return chatUserCard(doctorChat :list[index]);
            }
      );
          }
        )
    );
  }
}
