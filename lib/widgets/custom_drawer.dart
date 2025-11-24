import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onNavigationToggle;
  final VoidCallback onThemeToggle;
  final bool isLightTheme;
  final bool useBottomNav;

  const CustomDrawer({
    super.key,
    required this.onNavigationToggle,
    required this.onThemeToggle,
    required this.isLightTheme,
    required this.useBottomNav,
  });

  void _safePop(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Navigation Settings',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.swap_horiz),
            title: Text(
              useBottomNav ? "Use Tabs Navigation" : "Use Bottom Navigation",
            ),
            onTap: () {
              onNavigationToggle();
              _safePop(context);
            },
          ),
          ListTile(
            leading: Icon(isLightTheme ? Icons.dark_mode : Icons.light_mode),
            title: Text(
              isLightTheme ? "Switch to Dark Theme" : "Switch to Light Theme",
            ),
            onTap: () {
              onThemeToggle();
              _safePop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text("Current: ${useBottomNav ? "Bottom Nav" : "Tab Bar"}"),
            subtitle: Text("Theme: ${isLightTheme ? "Light" : "Dark"}"),
          ),
        ],
      ),
    );
  }
}
