import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'admin_screen.dart';
import 'user.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Lista de logins válidos
  final List<Map<String, String>> validLogins = [
    {
      'email': '123456',
      'password': '123456',
      'type': 'admin',
      'name': 'Admin 1',
      'profilePicture': 'assets/admin1.png',
    },
    {
      'email': 'admin',
      'password': 'admin123',
      'type': 'admin',
      'name': 'Admin 2',
      'profilePicture': 'assets/admin2.png',
    },
    {
      'email': 'goncalo.velez@edubga.com',
      'password': 'Bolhas31@',
      'type': 'user',
      'name': 'Gonçalo Velez',
      'profilePicture': 'assets/goncaloprofile.jpg',
    },
    {
      'email': 'test',
      'password': 'test123',
      'type': 'user',
      'name': 'Test User',
      'profilePicture': 'assets/testprofilepicture.png',
    },
    {
      'email': 'antonio@edubga.com',
      'password': '1234',
      'type': 'user',
      'name': 'António Fernandes',
      'profilePicture': 'assets/antonioprofilepicture.jpg',
    },
  ];

  void _login(BuildContext context) {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final user = validLogins.firstWhere(
      (login) => login['email'] == email && login['password'] == password,
      orElse: () => <String, String>{},
    );

    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final authenticatedUser = User(
        name: user['name'] ?? 'Guest',
        email: user['email'] ?? '',
        profilePicture: user['profilePicture'] ?? 'assets/default_profile.png',
        type: user['type'] ?? 'user',
      );

      if (user['type'] == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => AdminScreen(user: authenticatedUser, users: []),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(user: authenticatedUser),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 150),
                  const SizedBox(height: 40),
                  // Adiciona o texto "Informatic Secondary School"
                  const Text(
                    'Informatic Secondary School',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _login(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _login(context),
                    child: const Text('LOGIN'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
