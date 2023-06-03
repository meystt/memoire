import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_and_doctor_appointment/screens/login/firebaseAuth.dart';


FirebaseFirestore _firestore=FirebaseFirestore.instance;
User user;

class ChatScreenDoctor extends StatefulWidget {
  const ChatScreenDoctor({this.patientMail ,Key key}) : super(key: key);
  final String patientMail;
  @override
  _ChatScreenDoctorState createState() => _ChatScreenDoctorState();
}

class _ChatScreenDoctorState extends State<ChatScreenDoctor> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  String messageText;

  final  messageTextController=TextEditingController();

  void initState(){
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser(){
    try{
      if(user==null){
        user=_auth.currentUser;
      }
    } catch(e){}
  }

  void _getMessage () async{
    final  messages= await FirebaseFirestore.instance.collection("messages").get();

    for(var message in  messages.docs){
      print(message.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.asset('images/logo.png', height: 25),
            SizedBox(width: 10),
            Text('MessageMe')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // add here logout function
              _getMessage();
            },
            icon: Icon(Icons.download),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(patientMail: widget.patientMail,),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText=value;

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      String id = widget.patientMail+user.email;
                      _firestore.collection("messages").doc("hh@g.comdoctor@doctor.com").collection("private").doc().set({
                        'text':messageText,
                        'sender':user.email

                      });
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({this.patientMail,Key key}) : super(key: key);
  final String  patientMail;


  String _getId(){
    String id = patientMail+user.email;
    return "hh@g.comdoctor@doctor.com";
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

      stream: _firestore.collection("messages").doc(_getId()).collection("private").snapshots(),
      builder: (context ,snapshot){
        List<MessageLine> messageWidgets = [];

        if(!snapshot.hasData){

        }

        final messages= snapshot.data.docs;

        for(var message in messages){

          final messageText = message.get("text");
          final messageSender= message.get("sender");
          final currentUserEmail=FirebaseAuth.instance.currentUser.email;
          final messageWidget=MessageLine(isMe:currentUserEmail==messageSender
              ,text: messageText
              ,sender: messageSender);

          messageWidgets.add(messageWidget);

        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}




class MessageLine extends StatelessWidget {
  const MessageLine({this.isMe,this.text,this.sender,Key key}) : super(key: key);


  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender',
            style: TextStyle(fontSize: 12,color: Colors.black45),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe?
            BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft:Radius.circular(30),
                bottomRight:Radius.circular(30)):
            BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft:Radius.circular(30),
                bottomRight:Radius.circular(30)),

            color: isMe? Colors.blueAccent:Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
              child: Text(
                '$text',
                style:   TextStyle(fontSize: 15,color: isMe? Colors.white:Colors.black),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

