import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  User user;

class ChatScreen extends StatefulWidget {
  const ChatScreen({this.doctorMail ,this.doctorName,Key key}) : super(key: key);
  final String doctorMail;
  final String doctorName;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

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
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          children: [
            Image.asset('assets/chatblue.png', height: 50),
            SizedBox(width: 25),
            Text(widget.doctorName),
          ],
        ),

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(doctorMail: widget.doctorMail,),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.lightBlue,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),

                      onPressed: () {
                          if(messageTextController.text.isEmpty)return;
                        messageTextController.clear();
                        String id = user.email+widget.doctorMail;
                        _firestore.collection("messages").doc(id).collection("private").doc().set({
                          'text':messageText,
                          'sender':user.email,
                          'time':FieldValue.serverTimestamp(),
                        });
                      }),
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
  const MessageStreamBuilder({this.doctorMail,Key key}) : super(key: key);
final String  doctorMail;
  

  String _getId(){
    String id = user.email+ doctorMail;
    return id;
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
       
      stream: _firestore.collection("messages").doc(_getId()).collection("private").orderBy('time').snapshots(),
      builder: (context ,snapshot){
        List<MessageLine> messageWidgets = [];

        if(!snapshot.hasData){

        }

        final messages= snapshot.data.docs.reversed;

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
            reverse: true,
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

