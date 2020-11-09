
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{

  @override
  String get searchFieldLabel => "Search in emails";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty ? Icon(Icons.keyboard_voice) : IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

}