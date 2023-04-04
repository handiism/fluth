import 'package:firebase_core/firebase_core.dart';
import 'package:fluth/firebase_options.dart';
import 'package:fluth/register.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}
