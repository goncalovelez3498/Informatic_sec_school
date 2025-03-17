import 'package:flutter/material.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração para Windows
  if (Platform.isWindows) {
    setWindowTitle('My App'); // Define o título da janela
    setWindowMinSize(const Size(360, 640)); // Define o tamanho mínimo
    setWindowMaxSize(const Size(360, 640)); // Define o tamanho máximo
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', // Define a rota inicial
      routes: {
        '/login': (context) => LoginScreen(), // Tela de login
        '/home':
            (context) => HomeScreen(
              user: User(
                name: "John Doe",
                email: "john.doe@example.com",
                profilePicture: "assets/default_profile.png",
                type: "admin",
              ),
            ), // Tela inicial (HomeScreen)
      },
      debugShowCheckedModeBanner: false, // Remove o banner de debug
    );
  }
}
