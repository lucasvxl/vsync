import 'package:flutter/material.dart';
import 'package:vitasync/health.dart';
import 'package:vitasync/profile.dart';
import 'package:vitasync/rewards.dart';
import 'package:vitasync/community.dart';

void main() => runApp(VitaSyncApp());

class VitaSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaSync',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Para começar na tela HomeContent

  // Lista de telas
  final List<Widget> _screens = [
    VitaSyncHealth(),
    VitasyncRewards(),
    HomeContent(),
    VitaSyncCommunity(),
    VitaSyncProfileApp()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza a tela selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Mostra a tela selecionada
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Saúde'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Recompensas'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), // HomeContent é agora o índice 2
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Comunidade'), // VitaSyncCommunity é o índice 3
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex, // Atualiza o índice atual
        onTap: _onItemTapped, // Chama a função ao tocar
        selectedItemColor: Color(0xFF7CB342),
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20), // Ajustado para ficar mais próximo da navbar
        child: FloatingActionButton(
          onPressed: () {
            // Alterar para a tela de perfil sem remover o BottomNavigationBar
            setState(() {
              _selectedIndex = 4; // Índice da tela de perfil
            });
          },
          child: Icon(Icons.question_mark),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<String> news = [
    'Inmet emite aviso para baixa umidade do ar na Grande SP; veja como prevenir doenças.',
    'Estudo revela benefícios da prática regular de atividades físicas para a saúde mental.',
    'Alimentos ricos em fibras podem melhorar a digestão e ajudar na perda de peso.',
    'A importância de manter-se hidratado durante o verão.',
    'Exercícios de respiração ajudam a reduzir o estresse e a ansiedade.',
    'Dicas para melhorar a qualidade do sono e evitar a insônia.',
    'A influência do consumo de açúcar na saúde geral.',
    'Benefícios da meditação para o bem-estar mental e emocional.',
    'A relação entre atividade física e saúde cardiovascular.',
    'Como um bom planejamento alimentar pode contribuir para a saúde.',
    'Dicas para manter uma rotina saudável durante a correria do dia a dia.',
    'A importância de check-ups regulares para a prevenção de doenças.'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF7CB342),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Gadgets                      ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoCard(title: 'Peso', value: '00.00'),
                  SizedBox(width: 5),
                  InfoCard(title: 'Água', value: '00:00'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ActivityCard(),
            ),
            SizedBox(height: 30),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF7CB342),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Principais Notícias Diárias                      ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0),
            // Exibe as notícias usando um ListView
            Column(
              children: news.map((item) => NewsCard(text: item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final double height;

  InfoCard({required this.title, required this.value, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 180,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (14),
              color: Color(0xFF7CB342), // Definindo a cor diretamente
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF3A3A3A)), // Definindo a cor diretamente
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            'Atividades',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF7CB342), // Definindo a cor diretamente
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tipo',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3A3A3A), // Definindo a cor diretamente
                ),
              ),
              Text(
                'Duração',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3A3A3A), // Definindo a cor diretamente
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String text;

  NewsCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(25),
      ),
      constraints: BoxConstraints(minHeight: 80),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF3A3A3A), // Definindo a cor diretamente
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}