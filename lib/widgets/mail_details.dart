
import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/models/mail.dart';
import 'package:provider/provider.dart';

class MailDetailsWidget extends StatefulWidget {

  @override
  _MailDetailsWidgetState createState() => _MailDetailsWidgetState();
}

class _MailDetailsWidgetState extends State<MailDetailsWidget> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {

    var mailIndex = Provider.of<Mail>(context);
    int index = mailIndex.currentMailIndex;
    Mail mail;
    if(index != null){
      mail = mails[index];
    }
    return index != null ? Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Text(mail.subject.toUpperCase(), style: TextStyle(fontSize: 20.0),)
              ),
              Icon(Icons.star_border)
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0, right: 0),
            title: Text(mail.senderName),
            subtitle: Row(
              children: <Widget>[
                Text("to ${mail.toAddress}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                SizedBox(width: 8.0,),
                InkWell(
                    onTap: (){
                      setState(() {
                        _isOpen = !_isOpen;
                      });
                    },
                    child: Icon(_isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,)
                )
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: mail.bgColor,
              child: Text(mail.fromAddress.substring(0,1).toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            trailing: FittedBox(
              child: Row(
                children: <Widget>[
                  Transform.rotate(
                      angle: 3.1,
                      child: Icon(Icons.subdirectory_arrow_right, size: 23,)
                  ),
                  SizedBox(width: 10.0,),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
          ),
          Visibility(
            visible: _isOpen,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey[200]),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10.0, right: 10),
                      leading: Text("From"),
                      title: Text(" ${mail.senderName} . ${mail.fromAddress}"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10.0, right: 10),
                      leading: Text("To"),
                      title: Text(" ${mail.toAddress}"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10.0, right: 10),
                      leading: Text("Date"),
                      title: Text(" ${mail.date}, ${mail.time}"),
                    )
                  ],
                )
            ),
          ),
          Text(mail.body)
        ],
      ),
    ) : Center(
      widthFactor: 2.0,
      heightFactor: 50.0,
      child: Text("Select a mail to load..."),
    );


  }
}


