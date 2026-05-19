import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'Widgets/splash.dart';
//import 'Widgets/lisiting.dart';
import 'Widgets/fragment_holder.dart';
void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FragmentHolder(),
        ),
    );
  }
}