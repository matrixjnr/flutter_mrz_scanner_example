import 'package:flutter/material.dart';
import 'package:mrz_flutter_example/pages/camera_page.dart';
import 'package:mrz_flutter_example/pages/passport_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MRZ Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PassportFormPage(),
      // home: CameraPage(),
    );
  }
}
