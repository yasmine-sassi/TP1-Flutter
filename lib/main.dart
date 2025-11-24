import 'package:flutter/material.dart';
import 'models/user.dart';
import 'services/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important pour SharedPreferences

  final userService = UserService();

  // 1. Créer un utilisateur
  final newUser = User(
    email: "jean.dupont@example.com",
    fullName: "Jean Dupont",
  );

  // 2. Sauvegarder
  await userService.saveCurrentUser(newUser);

  // 3. Récupérer et afficher
  final savedUser = await userService.getCurrentUser();
  print("Utilisateur actuel : $savedUser");

  // 4. Simuler une déconnexion
  // await userService.clearCurrentUser();

  // 5. Vérifier après déconnexion (décommente la ligne ci-dessus pour tester)
  // final userAfterClear = await userService.getCurrentUser();
  // print("Après déconnexion : $userAfterClear");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Voir la console pour le test SharedPreferences'),
        ),
      ),
    );
  }
}
