import 'package:flutter/material.dart';
import 'package:tp1/widgets/main_navigation.dart';
import 'package:tp1/screens/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLightTheme = true;

//   void _toggleTheme() {
//     setState(() {
//       _isLightTheme = !_isLightTheme;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Store INSAT',
//       theme: _isLightTheme ? ThemeData.light() : ThemeData.dark(),
//       home: MainNavigation(
//         isLightTheme: _isLightTheme,
//         onThemeToggle: _toggleTheme,
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Multi-Pane Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ResponsiveLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
