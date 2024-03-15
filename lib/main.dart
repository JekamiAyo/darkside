import 'package:darkside/ocr_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    if (kDebugMode) {
      print('Error: $e.code\nError Message: $e.message');
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Godwin Progress Chijioke',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: OCRScreen(),
    );
  }
}