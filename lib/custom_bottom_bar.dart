import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'user.dart';

class CustomBottomBar extends StatelessWidget {
  final User? user; // Parâmetro opcional

  const CustomBottomBar({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Altura fixa da barra inferior
      child: BottomAppBar(
        color: const Color(0xFF2E6F99), // Cor da barra inferior
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Botão Motivation
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Motivation clicked!")),
                );
              },
              child: const Text(
                "Motivation",
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Botão Contact
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Contact clicked!")),
                );
              },
              child: const Text(
                "Contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Botão Perfil com a foto de perfil do utilizador
            GestureDetector(
              onTap: () {
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: user),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No user logged in!")),
                  );
                }
              },
              child:
                  user != null && user!.profilePicture.isNotEmpty
                      ? CircleAvatar(
                        radius: 18, // Ajusta o tamanho do ícone
                        backgroundImage: AssetImage(user!.profilePicture),
                        backgroundColor: Colors.grey[200], // Fundo padrão
                      )
                      : const Icon(
                        Icons.person,
                        size: 28, // Ajusta o tamanho do ícone padrão
                        color: Colors.white,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
