import 'package:flutter/material.dart';

class EducationalVideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vídeos Educativos', style: TextStyle(color: Color(0xFF3A3A3A))),
        backgroundColor: Colors.green.shade400,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            VideoCard(
              title: 'Nutrição Básica',
              description: 'Aprenda os fundamentos da nutrição e como ela afeta sua saúde.',
              videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Exemplo de URL de vídeo
            ),
            VideoCard(
              title: 'Exercícios para Iniciantes',
              description: 'Uma introdução a exercícios físicos simples para iniciantes.',
              videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Exemplo de URL de vídeo
            ),
            VideoCard(
              title: 'Importância da Hidratação',
              description: 'Entenda como a hidratação é essencial para o bem-estar.',
              videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Exemplo de URL de vídeo
            ),
            VideoCard(
              title: 'Saúde Mental',
              description: 'Dicas para manter a saúde mental em dia.',
              videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Exemplo de URL de vídeo
            ),
            // Adicione mais VideoCard conforme necessário
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;

  VideoCard({required this.title, required this.description, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7CB342),
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Color(0xFF3A3A3A)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para abrir o vídeo no navegador ou em um player
                // Por exemplo:
                // launch(videoUrl); (necessário o pacote url_launcher)
              },
              child: Text('Assistir Vídeo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
