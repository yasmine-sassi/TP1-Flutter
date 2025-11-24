import 'package:flutter/material.dart';
import 'package:tp1/widgets/bottom_navBar.dart';
import 'package:tp1/widgets/tab_bar.dart';

class MainNavigation extends StatefulWidget {
  final bool isLightTheme;
  final VoidCallback onThemeToggle;

  const MainNavigation({
    super.key,
    required this.isLightTheme,
    required this.onThemeToggle,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  bool _useBottomNav = true;

  void _toggleNavigation() {
    setState(() {
      _useBottomNav = !_useBottomNav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Example"),
        backgroundColor: _useBottomNav
            ? null
            : const Color.fromARGB(255, 11, 106, 49),
      ),
      drawer: _buildDrawer(context),
      body: _useBottomNav ? const BottomNavBar() : const MyTabBar(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: widget.isLightTheme ? Colors.green : Colors.green[800],
            ),
            child: Text(
              'Navigation Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.swap_horiz,
              color: widget.isLightTheme ? Colors.green : Colors.green[200],
            ),
            title: Text(
              _useBottomNav ? "Use Tabs Navigation" : "Use Bottom Navigation",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              _toggleNavigation();
              _closeDrawer(context);
            },
          ),
          ListTile(
            leading: Icon(
              widget.isLightTheme ? Icons.dark_mode : Icons.light_mode,
              color: widget.isLightTheme ? Colors.orange : Colors.amber,
            ),
            title: Text(
              widget.isLightTheme
                  ? "Switch to Dark Theme"
                  : "Switch to Light Theme",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              widget.onThemeToggle();
              _closeDrawer(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: widget.isLightTheme ? Colors.grey[600] : Colors.grey[400],
            ),
            title: Text(
              "Current Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.isLightTheme
                    ? Colors.grey[700]
                    : Colors.grey[300],
              ),
            ),
            subtitle: Text(
              "Navigation: ${_useBottomNav ? "Bottom Nav" : "Tab Bar"}\nTheme: ${widget.isLightTheme ? "Light" : "Dark"}",
              style: TextStyle(
                color: widget.isLightTheme
                    ? Colors.grey[600]
                    : Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }
}
