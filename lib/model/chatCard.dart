import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_and_doctor_appointment/DoctorChat.dart';

import '../screens/chat/chat_screen.dart';

class chatUserCard extends StatefulWidget {
  final DoctorChat doctorChat;
  const chatUserCard({Key key, this.doctorChat}) : super(key: key);
  @override
  State<chatUserCard> createState() => _chatUserCardState();
}

class _chatUserCardState extends State<chatUserCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.5,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                doctorMail: widget.doctorChat.mail,
                doctorName: widget.doctorChat.name,
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title:Text(widget.doctorChat.name),
          subtitle: Text('Last Message',maxLines: 1,),
          trailing: Text(
            '12:00 PM',
            style: TextStyle(color: Colors.black54),
          ),
        ),

      ),
    );
  }
}

