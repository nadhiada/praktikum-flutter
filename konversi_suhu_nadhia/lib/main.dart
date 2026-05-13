import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'login_page.dart';
import 'temperature_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(

    ChangeNotifierProvider(
      create: (_) => TemperatureProvider(),
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Konversi Suhu Nadhia',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(

          seedColor: const Color.fromARGB(
            255,
            255,
            179,
            200,
          ),

        ),

        useMaterial3: true,

      ),

      home: const LoginPage(),

    );
  }
}