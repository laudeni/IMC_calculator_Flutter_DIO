import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/main_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            displaySmall:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            displayMedium:
                TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            displayLarge: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          appBarTheme: const AppBarTheme(color: Colors.blueGrey)),
      home: const MainPage(),
    );
  }
}
