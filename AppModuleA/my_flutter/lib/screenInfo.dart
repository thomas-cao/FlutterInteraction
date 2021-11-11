import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenInfo {
  static MediaQueryData medaiQueryData = MediaQueryData.fromWindow(window); 
  static double statusBarHeight = medaiQueryData.padding.top;
}