import 'package:flutter/material.dart';

class darkMode extends ChangeNotifier{

   bool _is_dark=false;

  bool get is_dark => _is_dark;

  void Toggle(bool value){
    _is_dark=!_is_dark;
    notifyListeners();
  }

}