import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/models/mail.dart';
import 'package:flutter_gmail_clone/screens/mail_details_screen.dart';
import 'package:flutter_gmail_clone/utilities/data_search.dart';
import 'package:flutter_gmail_clone/utilities/size_config.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class InboxMailList extends StatefulWidget {

  final GlobalKey<ScaffoldState> globalKey;

  const InboxMailList({this.globalKey});

  @override
  _InboxMailListState createState() => _InboxMailListState();
}

class _InboxMailListState extends State<InboxMailList> {

  Color bgColor;
  List<bool> _isSelected = List.generate(mails.length, (i) => false);
  bool _itemSelected = false;
  List<int> _selectedMails =[];

  Widget _appBarRow(BuildContext context){
    return Container(
      margin: EdgeInsets.all(1.46 * SizeConfig.heightMultiplier),// 10.0
      child: _itemSelected ? Container(
        margin: EdgeInsets.only(top: 15.0, ),
        child: Row(
          children: <Widget>[
            InkWell(
              child: Icon(Icons.arrow_back),
              onTap: (){
                setState(() {
                  _itemSelected = false;
                  print("Selected: ${_isSelected.length}");
                  for(int i = 0; i < mails.length; i++){
                    _isSelected[i] = false;
                  }
                  _selectedMails.clear();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Text(_selectedMails.length > 0 ? _selectedMails.length.toString() : ''),
            ),
            Spacer(),
            Icon(Icons.delete, color: Colors.grey[700]),
            SizedBox(width: 15.0,),
            Icon(Icons.mail_outline, color: Colors.grey[700],),
            SizedBox(width: 15.0, ),
            Icon(Icons.more_vert, color: Colors.grey[700]),
            SizedBox(width: 10.0,),
          ],
        ),
      )  : Material(
        elevation: 0.73 * SizeConfig.heightMultiplier,
        borderRadius: BorderRadius.circular(1.46 * SizeConfig.heightMultiplier), // 10.0
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:2.05 * SizeConfig.heightMultiplier, vertical: 3.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  if(widget.globalKey.currentState.isDrawerOpen) widget.globalKey.currentState.openEndDrawer();
                  else widget.globalKey.currentState.openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.black,)
              ),
              SizedBox(width: 2.93 * SizeConfig.heightMultiplier,), //20.0
              Expanded(
                child: InkWell(
                    onTap: () async{
                      await showSearch(
                          context: context,
                          delegate: DataSearch(),
                      );
                    },
                    child: Text("Search in emails", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 2.64 * SizeConfig.textMultiplier, color: Colors.grey[600]),) //18.0
                )
              ),
              CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.all(1.17 * SizeConfig.heightMultiplier), // 1.17 = 8.0
                  child: Text("U"),
                ),
               backgroundColor: Colors.green[900],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mailIndex = Provider.of<Mail>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: _appBarRow(context),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.46 * SizeConfig.heightMultiplier, vertical: 1.46 * SizeConfig.heightMultiplier),
            child: Text("INBOX", style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.32 * SizeConfig.imageSizeMultiplier ),), // 0.19 = 1.3
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Mail mail = mails[index];
              bgColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
              mail.bgColor = bgColor;
              return Dismissible(
                key: Key("${mail.senderName}$index"),
                onDismissed: (direction){
                  mails.removeAt(index);
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("${mail.senderName}\'s mail dismissed")));
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: _isSelected[index] ? Colors.blue[200] : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  margin: EdgeInsets.only(bottom: 2.5, left: 5.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 1.46 * SizeConfig.heightMultiplier, right: 1.46 * SizeConfig.heightMultiplier, bottom: 2.2 * SizeConfig.heightMultiplier), // 2.2 = 15
                    title: Row(
                      children: <Widget>[
                        Text(mail.fromAddress, style: TextStyle(),),
                        Spacer(),
                        mail.hasAttachment ? Icon(Icons.attachment, size: 2.64 * SizeConfig.heightMultiplier, color: Colors.grey[400],) : SizedBox.shrink(),
                      ],
                    ),
                    leading: _isSelected[index] ? CircleAvatar( backgroundColor: Colors.blue, child: Icon(Icons.check),)
                        : CircleAvatar(
                      backgroundColor: bgColor,
                      child: Text(mail.fromAddress.substring(0,1).toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    trailing: Column(
                      children: <Widget>[
                        Text(mail.date.substring(0, 5),),
                        Spacer(),
                        Icon(Icons.star_border)
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(mail.subject, maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Text(mail.body, maxLines: 1, overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                    onTap: (){
                      if(MediaQuery.of(context).size.width >= 600){
                        mailIndex.currentMailIndex = index;
                      }else{
                        mailIndex.currentMailIndex = index;
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_) => MailDetail()
                      ));
                      }

                    },
                    onLongPress: (){
                      setState(() {
                        _isSelected[index] = !_isSelected[index];
                        if(_selectedMails.contains(index)){
                          _selectedMails.remove(index);
                        }else{
                          _selectedMails.add(index);
                        }

                        if(_selectedMails.length <= 0){
                          _itemSelected = false;
                        }else{
                          _itemSelected = true;
                        }
                      });
                    },
                  ),
                ),
              );
            },
            childCount: mails.length,
          ),
        )
      ],
    );
  }
}
