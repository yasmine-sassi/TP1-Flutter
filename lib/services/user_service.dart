/*saveCurrentUser: sauvegarder les informations dans sharedPreferences
getCurrentUser : retourne l’utilisateur si trouvé
clearCurrentUser : Supprimer les données locales*/
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserService {
  static const currentEmailKey = 'current_email';
  static const currentFullNameKey = 'current_full_name';

  Future<void> saveCurrentUser(User user) async {
    await SharedPreferences.getInstance().then((sp) async {
      await sp.setString(currentEmailKey, user.email ?? "");
      await sp.setString(currentFullNameKey, user.fullName ?? "");
    });
  }

  Future<User?> getCurrentUser() async {
    User u = User();
    await SharedPreferences.getInstance().then((sp) {
      u.email = sp.getString(currentEmailKey)!;
      u.fullName = sp.getString(currentFullNameKey)!;
    });
    return u;
  }

  Future<void> clearCurrentUser() async {
    await SharedPreferences.getInstance().then((sp) async {
      await sp.remove(currentEmailKey);
      await sp.remove(currentFullNameKey);
    });
  }
}
