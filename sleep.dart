import 'package:flutter/material.dart';

void main() {
  runApp(SleepScreenApp());
}

class SleepScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SleepScreen(),
    );
  }
}

class SleepScreen extends StatefulWidget {
  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final List<Map<String, dynamic>> sleepGoals = [
    {
      "titulo": "Durma 7 horas",
      "descricao": "Meta para uma boa noite de sono",
      "recompensa": "10 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Evite telas antes de dormir",
      "descricao": "Evite o uso de dispositivos eletrônicos 30 minutos antes de dormir.",
      "recompensa": "5 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Acorde cedo por 5 dias seguidos",
      "descricao": "Estabeleça uma rotina saudável de sono.",
      "recompensa": "15 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Realize uma meditação antes de dormir",
      "descricao": "Relaxe a mente para uma noite de sono tranquila.",
      "recompensa": "8 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Evite cafeína após 18h",
      "descricao": "Evite alimentos e bebidas com cafeína à noite.",
      "recompensa": "12 Moedas de Saúde",
      "concluido": false,
    },
  ];

  void _toggleGoalCompletion(int index) {
    setState(() {
      sleepGoals[index]['concluido'] = !sleepGoals[index]['concluido'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento do Sono'),
        backgroundColor: Color(0xFF7CB342),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sleepGoals.length,
          itemBuilder: (context, index) {
            final goal = sleepGoals[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  goal['concluido'] ? Icons.check_circle : Icons.circle_outlined,
                  color: goal['concluido'] ? Colors.green : Colors.grey,
                ),
                title: Text(
                  goal['titulo'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7CB342),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(goal['descricao']),
                    SizedBox(height: 8),
                    Text(
                      'Recompensa: ${goal['recompensa']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goal['concluido'] ? Colors.grey :Color(0xFF7CB342),
                  ),
                  onPressed: () => _toggleGoalCompletion(index),
                  child: Text(
                    goal['concluido'] ? 'Concluído' : 'Completar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
