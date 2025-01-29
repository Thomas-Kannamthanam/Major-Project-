import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserService {
  static const String userKey = 'user';

  // Save user data to shared preferences
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toMap());
    await prefs.setString(userKey, userJson);
  }

  // Retrieve user data from shared preferences
  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(userKey);

    // Check if userJson is not null before decoding
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromMap(userMap);
    } else {
      // Return null if userJson is null
      return null;
    }
  }
}