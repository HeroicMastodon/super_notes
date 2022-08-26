import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Loader extends HookWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Loading");
  }

}