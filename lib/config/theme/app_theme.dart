
import 'package:flutter/material.dart';

const Color _lightPrimaryColor = Color.fromARGB(255, 58, 182, 240);

const List<Color> _colorThemes = [
 _lightPrimaryColor,
 Colors.blue,
 Colors.red,
 Colors.green,
 Colors.purple,
 Colors.orange, 
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }) : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 
      'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }  
}