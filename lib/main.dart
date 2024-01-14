// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqflite_app/globals.dart';
import 'package:sqflite_app/screens/display_notes_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseHelper.initializeDatabase();
  notes = await databaseHelper.getNoteList();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: DisplayNotesScreen()));
}
