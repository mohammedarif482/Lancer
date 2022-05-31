import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
 navchange(newIndex, currentIndex) {
    currentIndex = newIndex;
    notifyListeners();
    return currentIndex;
  } 
}