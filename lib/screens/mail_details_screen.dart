
import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/widgets/mail_details.dart';

class MailDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.grey[700],)
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Icon(Icons.delete, color: Colors.grey[700]),
          SizedBox(width: 15.0,),
          Icon(Icons.mail_outline, color: Colors.grey[700],),
          SizedBox(width: 15.0, ),
          Icon(Icons.more_vert, color: Colors.grey[700]),
          SizedBox(width: 10.0,),
        ],
      ),
      body: MailDetailsWidget()
    );
  }
}

