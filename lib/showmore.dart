import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShowMore extends StatefulWidget{

  final String content;
  final double desiredMaxHeight;
  final double desiredMinHeight;

  const ShowMore({
    Key key,
    @required this.content, 
    @required this.desiredMaxHeight, 
    @required this.desiredMinHeight}) : 
    assert(content != null),
    assert(desiredMaxHeight != null),
    assert(desiredMinHeight != null),
    super(key: key);

  @override
  ShowMoreState createState()=> ShowMoreState();
}

class ShowMoreState extends State<ShowMore>{

  _onTap update;
  ShowStatus showStatus;

  @override
  void initState(){
    super.initState();
    showStatus = ShowStatus.UNEXPANDED;
  }

  @override
  Widget build(BuildContext context){

    return Column(
      children: <Widget>[

        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          width: double.infinity,
          height: showStatus == ShowStatus.EXPANDED ? widget.desiredMaxHeight : widget.desiredMinHeight,
          child: Text(
            widget.content,
            softWrap: true,
            overflow: TextOverflow.fade,
            )
          ),

        GestureDetector(
          onTap: update(){
            setState((){
              showStatus = showStatus == ShowStatus.EXPANDED ? ShowStatus.UNEXPANDED : ShowStatus.EXPANDED;
              });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showStatus == ShowStatus.EXPANDED ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
              showStatus == ShowStatus.EXPANDED ? Text("Show Less") : Text("Show More"),
            ]
            ) 
          ),
      ]
      );
  }
}


typedef void _onTap();

enum ShowStatus {
  UNEXPANDED,
  EXPANDED,
}