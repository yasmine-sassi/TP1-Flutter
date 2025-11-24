import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeSwitcherApp());
}

class ThemeSwitcherApp extends StatefulWidget {
  const ThemeSwitcherApp({super.key});

  @override
  State<ThemeSwitcherApp> createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  // true = thème clair, false = thème sombre
  bool isLightTheme = true;

  // Définir les thèmes
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Switcher Demo',
      theme: isLightTheme ? lightTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Theme Switcher"),
          actions: [
            IconButton(
              icon: Icon(isLightTheme ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                setState(() {
                  isLightTheme = !isLightTheme;
                });
              },
            ),
          ],
        ),
        body: const Center(
          child: Text("Hello, Flutter!", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
