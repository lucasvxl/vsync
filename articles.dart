import 'package:flutter/material.dart';

void main() {
  runApp(VitaSyncArt());
}

class VitaSyncArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArticleScreen(),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
        title: "Benefícios da Meditação para a Saúde",
        summary: "Descubra como a meditação pode melhorar seu bem-estar.",
        imageUrl: "https://via.placeholder.com/150",
        content: "A meditação é uma prática acessível e altamente benéfica para a saúde. Com apenas alguns minutos diários, você pode experimentar um bem-estar maior, fortalecimento do sistema imunológico e uma vida mais equilibrada. Experimente incorporar a meditação na sua rotina e descubra como ela pode transformar sua saúde e qualidade de vida."
    ),
    Article(
        title: "Dicas de Exercícios para Iniciantes",
        summary: "Saiba como começar sua jornada de exercícios físicos.",
        imageUrl: "https://via.placeholder.com/150",
        content: "Com dedicação e paciência, qualquer pessoa pode transformar a prática de exercícios em um hábito saudável. Lembre-se de que o mais importante é começar e manter uma rotina que seja sustentável e prazerosa para você. Com essas dicas, você está no caminho certo para alcançar suas metas e aproveitar todos os benefícios que o exercício físico pode oferecer!"
    ),
    Article(
        title: "Alimentos que Fortalecem o Sistema Imunológico",
        summary: "Conheça os alimentos que ajudam a fortalecer sua imunidade.",
        imageUrl: "https://via.placeholder.com/150",
        content: "Adotar uma alimentação balanceada e rica em alimentos que fortalecem o sistema imunológico é uma excelente maneira de prevenir doenças e manter a saúde em dia. Incorporar frutas cítricas, alho, gengibre, probióticos e vegetais na sua dieta ajuda a melhorar a resistência do corpo de forma natural e efetiva. Ao priorizar uma dieta rica em nutrientes, você cuida não apenas do sistema imunológico, mas também do seu bem-estar geral."
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artigos para Leitura"),
        backgroundColor: Color(0xFF7CB342),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.network(
                article.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                article.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7CB342),
                ),
              ),
              subtitle: Text(
                article.summary,
                style: TextStyle(color: Color(0xFF3A3A3A)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl),
            SizedBox(height: 16),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              article.content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String summary;
  final String imageUrl;
  final String content;

  Article({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.content,
  });
}
