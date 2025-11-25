import 'package:flutter/material.dart';
import 'package:tp1/screens/library_screen.dart';
import 'package:tp1/screens/basket_screen.dart';
import 'package:tp1/screens/auth/signup_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SignUpPage(),
    const LibraryScreen(),
    const BasketScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _pages[_currentIndex]),
        BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outlined),
              activeIcon: Icon(Icons.bookmark),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              activeIcon: Icon(Icons.shopping_basket_outlined),
              label: "Basket",
            ),
          ],
        ),
      ],
    );
  }
}
