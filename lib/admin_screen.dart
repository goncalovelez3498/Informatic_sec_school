import 'package:flutter/material.dart';
import '../user.dart'; // Importa o modelo User
import 'user_profile_screen.dart'; // Importa a tela de perfil do utilizador

class AdminScreen extends StatelessWidget {
  final User user; // Recebe o utilizador autenticado
  final List<User> users; // Lista de utilizadores registados

  const AdminScreen({
    super.key,
    required this.user,
    required this.users, // Recebe a lista de utilizadores
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        user: user,
      ), // Passa o utilizador para a barra superior
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final currentUser = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(currentUser.profilePicture),
              backgroundColor: Colors.grey[200],
            ),
            title: Text(currentUser.name),
            subtitle: Text(currentUser.email),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navegar para o perfil do utilizador
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(user: currentUser),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Barra superior personalizada para o Admin Screen
class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user; // Recebe o utilizador autenticado

  const AdminAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove o botão de "Back"
      backgroundColor: const Color(0xFFAA9CCC), // Cor da barra superior
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botão de logout no lado esquerdo
          IconButton(
            icon: Image.asset(
              'assets/logout.png', // Caminho para a imagem de logout
              height: 16, // Altura menor para o ícone
              width: 16, // Largura menor para o ícone
            ),
            onPressed: () {
              // Função de logout
              _logout(context);
            },
          ),
          Expanded(
            child: Text(
              "Admin Screen - ${user.name}", // Exibe o nome do utilizador
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow:
                  TextOverflow.visible, // Permite que o texto seja exibido todo
              textAlign: TextAlign.center, // Centraliza o texto
            ),
          ),
          // Logótipo sem funcionalidade de clique
          Image.asset(
            'assets/logo.png', // Caminho para o logótipo
            height: 40, // Altura do logótipo
            width: 40, // Largura do logótipo
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _logout(BuildContext context) {
    // Exemplo de funcionalidade de logout
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                  Navigator.of(context).pushReplacementNamed('/login');
                  // Substitua '/login' pela rota da sua página de login
                },
                child: const Text("Logout"),
              ),
            ],
          ),
    );
  }
}
