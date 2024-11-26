import 'package:flutter/material.dart';
import 'exercisedetailscreen.dart'; // Importando a tela de detalhes do exercício

class AnaerobicsScreen extends StatelessWidget {
  final Function(String) onStartExercise;

  AnaerobicsScreen({required this.onStartExercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Treinos Anaeróbicos',
          style: TextStyle(color: Color(0xFF3A3A3A)),
        ),
        backgroundColor: Color(0xFF7CB342),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fitness_bg.jpg'), // Adicione uma imagem de fundo aqui
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.05),
              BlendMode.dstATop,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Os exercícios anaeróbicos são ideais para aumentar a força muscular, ganho de massa magra e resistência. Esses treinos exigem alta intensidade em um curto período.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3A3A3A)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Exemplos de Exercícios:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7CB342),
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  _buildExerciseCard(
                    context: context,
                    icon: Icons.fitness_center,
                    exercise: 'Levantamento de Peso',
                  ),
                  _buildExerciseCard(
                    context: context,
                    icon: Icons.push_pin,
                    exercise: 'Flexões',
                  ),
                  _buildExerciseCard(
                    context: context,
                    icon: Icons.person_outline,
                    exercise: 'Abdominais',
                  ),
                  _buildExerciseCard(
                    context: context,
                    icon: Icons.sports_handball,
                    exercise: 'Agachamentos com Peso',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard({
    required BuildContext context,
    required IconData icon,
    required String exercise,
  }) {
    return GestureDetector(
      onTap: () {
        // Redireciona para a tela de detalhes
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseDetailScreen(
              exercise: exercise,
              onStartExercise: onStartExercise, // Registra o exercício no histórico
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        color: Color(0xFFEDE7F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 2,
        child: ListTile(
          leading: Icon(icon, color: Color(0xFF7CB342), size: 28),
          title: Text(
            exercise,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3A3A3A),
            ),
          ),
        ),
      ),
    );
  }
}
