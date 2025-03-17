import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // Importa o CustomAppBar
import 'custom_bottom_bar.dart'; // Importa o CustomBottomBar
import 'user.dart';
import 'login_screen.dart'; // Importa a tela de login

class ProfileScreen extends StatelessWidget {
  final User? user; // Parâmetro opcional

  const ProfileScreen({super.key, this.user});

  void _logout(BuildContext context) {
    // Mostra um diálogo de confirmação antes de fazer logout
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false, // Remove todas as telas anteriores
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Garante que o User não é nulo
    final nonNullUser =
        user ??
        User(
          name: "Guest",
          email: "No email available",
          profilePicture: "assets/default_profile.png",
          type: "guest",
        );

    return Scaffold(
      appBar: CustomAppBar(
        user: nonNullUser,
      ), // Passa o User garantidamente não nulo
      body: Container(
        color: Colors.white, // Fundo branco
        width:
            double.infinity, // Garante que o conteúdo preenche toda a largura
        child: Column(
          children: [
            // Parte superior: Imagem de perfil, texto e botão
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinha o conteúdo ao topo
                children: [
                  // Foto de perfil com borda preta fina
                  CircleAvatar(
                    radius: 50, // Tamanho da imagem
                    backgroundColor: Colors.black, // Cor da borda
                    child: CircleAvatar(
                      radius: 48, // Tamanho interno da imagem
                      backgroundImage: AssetImage(nonNullUser.profilePicture),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(width: 16), // Espaço entre a imagem e o texto
                  // Texto com nome, email e botão de logout
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Alinha o texto à esquerda
                      children: [
                        // Nome do utilizador
                        Text(
                          nonNullUser.name, // Exibe o nome do utilizador
                          style: const TextStyle(
                            fontSize: 18, // Tamanho ajustado para o nome
                            fontWeight: FontWeight.bold,
                          ),
                          overflow:
                              TextOverflow
                                  .ellipsis, // Trunca o texto se for muito longo
                          maxLines: 1, // Limita a uma linha
                        ),
                        const SizedBox(
                          height: 4,
                        ), // Espaço entre o nome e o email
                        // Email do utilizador
                        Text(
                          nonNullUser.email, // Exibe o email do utilizador
                          style: const TextStyle(
                            fontSize: 14, // Tamanho ajustado para o email
                            color: Colors.grey,
                          ),
                          overflow:
                              TextOverflow
                                  .ellipsis, // Trunca o texto se for muito longo
                          maxLines: 1, // Limita a uma linha
                        ),
                        const SizedBox(
                          height: 8,
                        ), // Espaço entre o texto e o botão
                        // Botão de logout
                        SizedBox(
                          width: 100, // Largura do botão
                          height: 27, // Altura do botão
                          child: ElevatedButton(
                            onPressed:
                                () => _logout(
                                  context,
                                ), // Chama a função de logout
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF2E6F99,
                              ), // Cor de fundo do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Bordas arredondadas
                              ),
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white, // Cor do texto
                                fontSize: 12, // Tamanho do texto
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ), // Espaço entre a parte superior e o gráfico
            // Parte inferior: Gráfico
            Expanded(
              child: Row(
                children: [
                  // Espaço vazio na metade esquerda
                  Expanded(flex: 1, child: Container()),
                  // Gráfico na metade direita
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      height: double.infinity, // Ocupa toda a altura disponível
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ), // Borda preta fina
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Bordas arredondadas
                      ),
                      child: const Center(
                        child: Text(
                          "Motivation Graph\n(Placeholder)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        user: nonNullUser,
      ), // Usa o CustomBottomBar
    );
  }
}
