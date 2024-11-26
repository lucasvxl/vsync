import 'package:flutter/material.dart';

class PersonalizedActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treinos Personalizados', style: TextStyle(color: Color(0xFF3A3A3A))),
        backgroundColor: Color(0xFF7CB342),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ActivityCard(
              title: 'Treino 1',
              description: 'Treino para perda de peso.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutScreen('Treino para perda de peso')),
                );
              },
            ),
            ActivityCard(
              title: 'Treino 2',
              description: 'Treino para ganho de massa.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutScreen('Treino para ganho de massa')),
                );
              },
            ),
            ActivityCard(
              title: 'Treino 3',
              description: 'Treino focado em resistência.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutScreen('Treino focado em resistência')),
                );
              },
            ),
            ActivityCard(
              title: 'Treino 4',
              description: 'Treino para fortalecimento muscular.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutScreen('Treino para fortalecimento muscular')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  ActivityCard({required this.title, required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFEDE7F6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
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
              onPressed: onPressed,
              child: Text('Gerar Treino'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7CB342),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  final String workoutType;

  WorkoutScreen(this.workoutType);

  // Exercícios separados por treino
  List<String> getWorkoutDetails() {
    switch (workoutType) {
      case 'Treino para perda de peso':
        return [
          'Polichinelos - 3 min',
          'Agachamentos - 3 séries de 15',
          'Burpees - 3 séries de 10',
          'Mountain Climbers - 3 séries de 20',
          'Prancha - 3 séries de 30 seg'
        ];
      case 'Treino para ganho de massa':
        return [
          'Flexões - 4 séries de 12',
          'Afundos - 4 séries de 12',
          'Elevação de quadril - 4 séries de 15',
          'Agachamento com uma perna - 3 séries de 10',
          'Prancha lateral - 3 séries de 20 seg'
        ];
      case 'Treino focado em resistência':
        return [
          'Corrida estacionária - 5 min',
          'Agachamento com salto - 4 séries de 15',
          'Burpees - 4 séries de 12',
          'Polichinelos - 3 séries de 1 min',
          'Prancha dinâmica - 4 séries de 30 seg'
        ];
      case 'Treino para fortalecimento muscular':
        return [
          'Flexões - 4 séries de 15',
          'Agachamento sumô - 4 séries de 20',
          'Afundos com salto - 4 séries de 10',
          'Prancha com elevação de pernas - 4 séries de 20 seg',
          'Abdominais bicicleta - 4 séries de 20'
        ];
      default:
        return ['Exercícios indisponíveis'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercises = getWorkoutDetails();
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutType, style: TextStyle(color: Color(0xFF3A3A3A))),
        backgroundColor: Color(0xFF7CB342),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Carrossel de exercícios
            Container(
              height: 200,  // Ajustando a altura do card
              child: PageView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color(0xFFEDE7F6),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Exercício ${index + 1}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7CB342),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            exercises[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3A3A3A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Espaço entre o carrossel e o vídeo
            // Espaço reservado para o vídeo
            Container(
              height: 200, // Altura do espaço reservado
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade600),
              ),
              child: Center(
                child: Text(
                  'Vídeo do Exercício',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Espaço entre o vídeo e o texto explicativo
            // Texto explicativo sobre o treino
            Text(
              _getWorkoutDescription(workoutType),
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF3A3A3A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getWorkoutDescription(String workoutType) {
    switch (workoutType) {
      case 'Treino para perda de peso':
        return 'Este treino foca em exercícios de alta intensidade para promover a queima de calorias e acelerar o metabolismo. Realizado com exercícios aeróbicos e de resistência.';
      case 'Treino para ganho de massa':
        return 'Focado em aumentar a força e a massa muscular, este treino utiliza exercícios de resistência com mais repetições e cargas mais altas.';
      case 'Treino focado em resistência':
        return 'Treino para melhorar a resistência física, com foco em exercícios aeróbicos e de força para manter a energia por mais tempo.';
      case 'Treino para fortalecimento muscular':
        return 'Exercícios para melhorar a resistência muscular e aumentar a força, com foco em movimentos que exigem controle e estabilidade.';
      default:
        return 'Descrição indisponível';
    }
  }
}