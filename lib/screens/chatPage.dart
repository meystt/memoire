import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../DoctorChat.dart';
import '../model/chatCard.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
  final String doctor;
  const ChatPage({Key key, this.doctor}) : super(key: key);
}

class _ChatPageState extends State<ChatPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  getMessage(){
    FirebaseFirestore.instance.collection("messages").where("from",isEqualTo: _auth.currentUser.email);
  }
  @override
  Widget build(BuildContext context) {
    List list=[];
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16 ,bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: widget.doctor,
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            Expanded(
               child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                  child: StreamBuilder(
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
                        list =data.map((e) => DoctorChat.fromJson(e.data())).toList() ??[];

                        return ListView.builder(
                            padding: EdgeInsets.only(top: 8),
                            itemCount: list.length ,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context,index){
                              return chatUserCard(doctorChat :list[index]);
                            }
                        );
                      }
                  ),
                ),
             ),

          ],
        ),
    );

  }
}