import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // Importa apenas o CustomAppBar
import 'custom_bottom_bar.dart'; // Importa apenas o CustomBottomBar
import 'user.dart'; // Importa o modelo User
// ignore: unused_import
import 'profile_screen.dart'; // Importa a página de perfil

class HomeScreen extends StatelessWidget {
  final User user; // Parâmetro obrigatório para o utilizador
  final Color backgroundColor; // Cor de fundo da Home Screen

  const HomeScreen({
    super.key,
    required this.user, // Torna o parâmetro obrigatório
    this.backgroundColor = Colors.white, // Cor de fundo padrão
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        user: user, // Reutiliza o CustomAppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Parte superior da tela (mensagem de boas-vindas)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Welcome, ${user.name}!", // Saudação personalizada
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Parte inferior da tela (secção de notícias)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem da notícia com cantos arredondados e espaçamento
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Cantos arredondados
                    child: Image.asset(
                      'assets/news_image.jpg', // Caminho para a imagem
                      height: 150, // Altura ajustada
                      width: double.infinity, // Largura total
                      fit: BoxFit.cover, // Ajusta a imagem ao espaço
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Título da notícia
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Tech Talent Academy Launches New AI Course for Beginners',
                    style: TextStyle(
                      fontSize: 16, // Tamanho ajustado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Descrição da notícia
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Tech Talent Academy, a renowned IT school, has introduced a new Artificial Intelligence course designed for beginners. The program aims to equip students with foundational skills in AI, machine learning, and data analysis, offering hands-on experience with real-world applications.',
                    style: TextStyle(
                      fontSize: 14, // Tamanho ajustado
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Citação
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '"We want to make AI accessible to everyone," said CEO Sarah Mitchell. "This course is perfect for those new to tech and eager to explore the future of innovation."',
                    style: TextStyle(
                      fontSize: 14, // Tamanho ajustado
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Informação adicional
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'The course begins next month, with limited spots available.',
                    style: TextStyle(
                      fontSize: 14, // Tamanho ajustado
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        user: user, // Reutiliza o CustomBottomBar
      ),
    );
  }
}
