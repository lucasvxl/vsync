import 'package:flutter/material.dart';

void main() {
  runApp(VitasyncRewards());
}

class VitasyncRewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecompensasScreen(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}

class RecompensasScreen extends StatefulWidget {
  @override
  _RecompensasScreenState createState() => _RecompensasScreenState();
}

class _RecompensasScreenState extends State<RecompensasScreen> {
  final List<Map<String, dynamic>> objetivos = [
    {
      "titulo": "Complete 10.000 passos em um dia",
      "descricao": "Mantenha-se ativo e atinja a meta de passos!",
      "recompensa": "10 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Beba 2 litros de água",
      "descricao": "Complete o objetivo para ganhar recompensas!",
      "recompensa": "5 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Durma 8 horas por 3 dias seguidos",
      "descricao": "Garanta uma boa noite de sono para melhorar sua saúde!",
      "recompensa": "20 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Faça uma sessão de meditação de 15 minutos",
      "descricao": "Relaxe a mente e melhore seu bem-estar.",
      "recompensa": "8 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Coma 5 porções de frutas em um dia",
      "descricao": "Mantenha uma alimentação saudável e balanceada!",
      "recompensa": "12 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Realize 30 minutos de exercício físico",
      "descricao": "Fortaleça seu corpo com uma atividade física diária.",
      "recompensa": "15 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Registre seu humor durante 7 dias",
      "descricao": "Acompanhe seu bem-estar emocional diariamente.",
      "recompensa": "25 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Caminhe ao ar livre por 20 minutos",
      "descricao": "Respire ar fresco e conecte-se com a natureza.",
      "recompensa": "10 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Evite açúcar processado por 3 dias seguidos",
      "descricao": "Reduza o consumo de açúcar e melhore sua saúde.",
      "recompensa": "18 Moedas de Saúde",
      "concluido": false,
    },
    {
      "titulo": "Alongue-se por 10 minutos ao acordar",
      "descricao": "Comece o dia com energia e flexibilidade.",
      "recompensa": "7 Moedas de Saúde",
      "concluido": false,
    },
  ];

  void _toggleObjective(int index) {
    setState(() {
      objetivos[index]['concluido'] = !objetivos[index]['concluido'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: objetivos.length,
        itemBuilder: (context, index) {
          final objetivo = objetivos[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                objetivo['concluido'] ? Icons.check_circle : Icons.circle_outlined,
                color: objetivo['concluido'] ? Colors.green : Colors.grey,
              ),
              title: Text(
                objetivo['titulo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7CB342),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(objetivo['descricao']),
                  SizedBox(height: 8),
                  Text(
                    'Recompensa: ${objetivo['recompensa']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: objetivo['concluido'] ? Colors.grey : Color(0xFF7CB342),
                ),
                onPressed: () => _toggleObjective(index),
                child: Text(
                  objetivo['concluido'] ? 'Concluído' : 'Completar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
