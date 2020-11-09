import 'package:flutter/material.dart';
import 'package:flutter_gmail_clone/models/mail.dart';
import 'package:flutter_gmail_clone/models/menu_item.dart';
import 'package:flutter_gmail_clone/screens/inbox_mail_list.dart';
import 'package:flutter_gmail_clone/utilities/size_config.dart';
import 'package:flutter_gmail_clone/utilities/styles.dart';
import 'package:flutter_gmail_clone/widgets/mail_details.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Mail(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Gmail Clone',
        theme: AppTheme.lightTheme,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _buildMenuItem(MenuItem item){
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 0),
      title: Text(item.itemName),
      leading: Icon(item.icon),
      trailing: Text(item.itemCount > 0 ? (item.itemCount >= 100 ? '99+' : item.itemCount.toString()) : ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mailIndex = Provider.of<Mail>(context);
    int index = mailIndex.currentMailIndex;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
      return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          SizeConfig().init(constraints, orientation);
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.only(
                  top: 2.93 * SizeConfig.heightMultiplier,),
                child: SizeConfig.screenWidth >= 600 ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: InboxMailList(globalKey: _scaffoldKey,),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30.0,),
                            index != null ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.delete, color: Colors.grey[700]),
                                SizedBox(width: 15.0,),
                                Icon(Icons.mail_outline, color: Colors.grey[700],),
                                SizedBox(width: 15.0, ),
                                Icon(Icons.more_vert, color: Colors.grey[700]),
                                SizedBox(width: 10.0,),
                              ],
                            ): SizedBox.shrink(),
                            MailDetailsWidget(),
                          ],
                        ),
                      ),
                    )
                  ],
                ) : InboxMailList(globalKey: _scaffoldKey,)
            ),
            drawer: Drawer(
              elevation: 2.0,
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40.0,),
                      Text("Gmail", style: TextStyle(color: Colors.redAccent, fontSize: 20.0),),
                      Divider(),
                      for(final MenuItem item in menuItems)
                        _buildMenuItem(item)
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.add, color: Colors.green,),
                    onPressed: () {
                    }
                ),
              ),
            ),
          );
        },
      );
    }
    );
  }
}
