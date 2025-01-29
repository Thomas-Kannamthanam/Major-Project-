// lib/main.dart
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'services/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserService _userService = UserService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    User? user = await _userService.getUser();
    if (user != null) {
      setState(() {
        _currentUser = user;
        _nameController.text = user.name;
        _phoneNumberController.text = user.phoneNumber;
      });
    }
  }

  void _saveUser() {
    String name = _nameController.text;
    String phoneNumber = _phoneNumberController.text;

    if (name.isNotEmpty && phoneNumber.isNotEmpty) {
      User user = User(name: name, phoneNumber: phoneNumber);
      _userService.saveUser(user);
      setState(() {
        _currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUser,
              child: const Text('Save User'),
            ),
            const SizedBox(height: 20),
            if (_currentUser != null)
              Text(
                'Saved User: ${_currentUser!.name}, ${_currentUser!.phoneNumber}',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}