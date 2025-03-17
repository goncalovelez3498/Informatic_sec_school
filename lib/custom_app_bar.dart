import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'user.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color appBarColor;
  final Color textColor;
  final User user; // Adiciona o objeto User como parâmetro obrigatório

  const CustomAppBar({
    super.key,
    required this.user, // Torna o User obrigatório
    this.appBarColor = const Color(0xFF2E6F99),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove o botão "back"
      backgroundColor: appBarColor, // Define a cor da barra superior
      title: Text(
        "I.S School",
        style: TextStyle(
          color: textColor, // Cor do texto
          fontSize: 18, // Tamanho do texto
          fontWeight: FontWeight.bold, // Negrito
        ),
      ),
      actions: [
        // Logótipo no lado direito
        GestureDetector(
          onTap: () {
            // Navega para a HomeScreen e passa o objeto User
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(user: user), // Passa o User
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ), // Espaçamento à direita
            child: Image.asset(
              'assets/logo.png', // Caminho para o logótipo
              height: 40, // Altura do logótipo
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
