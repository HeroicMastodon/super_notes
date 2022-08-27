import 'package:flutter/material.dart';
import 'package:notes/app/app.dart';
import 'package:notes/setup.dart';

void main() async {
  await setup();
  runApp(NotesApp());
}
