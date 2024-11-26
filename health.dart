import 'package:flutter/material.dart';
import 'package:vitasync/activities.dart';
import 'package:vitasync/articles.dart';
import 'package:vitasync/diets.dart';
import 'package:vitasync/videos.dart';
import 'package:vitasync/watercontrol.dart';
import 'package:vitasync/sleep.dart';

void main() {
  runApp(VitaSyncHealth());
}

class VitaSyncHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VitaSyncHome(),
      theme: ThemeData(
        primaryColor: Colors.green, // Cor primária verde
        scaffoldBackgroundColor: Colors.white, // Fundo branco
      ),
    );
  }
}

class VitaSyncHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF7CB342),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Encontre treinos diários personalizados e dicas para melhorar a qualidade do seu sono. Siga nosso guia alimentar para refeições balanceadas e agende lembretes para se manter hidratado ao longo do dia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ActivitiesScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.fitness_center, label: 'Treinos'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HydrationScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.local_drink_rounded, label: 'Água'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DietScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.apple, label: 'Dietas'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArticleScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.article, label: 'Artigos'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EducationalVideosScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.video_collection, label: 'Vídeos'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SleepScreen()),
                      );
                    },
                    child: IconCard(icon: Icons.nightlight_round, label: 'Sono'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const IconCard({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFFEDE7F6), // Fundo branco
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Color(0xFF7CB342), // Ícone verde
            ),
            SizedBox(height: 25),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3A3A3A), // Texto verde
              ),
            ),
          ],
        ),
      ),
    );
  }
}
