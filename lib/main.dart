// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqflite_app/screens/display_notes_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: DisplayNotesScreen()));
}
