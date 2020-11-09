import 'package:flutter/material.dart';

class SizeConfig{
  static double _screenWidth, _screenHeight, _horizontalBlockSize, _verticalBlockSize, textMultiplier, imageSizeMultiplier, heightMultiplier, screenWidth;

  void init(BoxConstraints constraints, Orientation orientation){
    if(orientation == Orientation.portrait){
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
    }else{
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    _horizontalBlockSize = _screenWidth/100;
    _verticalBlockSize =  _screenHeight/100;

    textMultiplier = _verticalBlockSize;
    imageSizeMultiplier = _horizontalBlockSize;
    heightMultiplier = _verticalBlockSize;
    screenWidth = _screenWidth;

    print("Horizontal Block Size: $_horizontalBlockSize");
    print("Vertical Block Size: $_verticalBlockSize");
  }
}