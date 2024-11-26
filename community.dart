import 'package:flutter/material.dart';

class VitaSyncCommunity extends StatefulWidget {
  @override
  _VitaSyncCommunityState createState() => _VitaSyncCommunityState();
}

class _VitaSyncCommunityState extends State<VitaSyncCommunity> {
  final List<Map<String, dynamic>> experiences = [
    {
      'name': 'Lucas',
      'text': 'Após muito tempo treinando, seguindo dietas e tomando água corretamente, consegui atingir minha meta de peso. OBRIGADO VITASYNC!!',
      'likes': 50,
    },
    {
      'name': 'Rodrigo',
      'text': 'Consegui arrumar tudo da minha vida que era relacionado com saúde, esse aplicativo realmente me ajudou.',
      'likes': 45,
    },
    {
      'name': 'Murilo',
      'text': 'Treinei regularmente e melhorei minha alimentação com as dicas do aplicativo. A comunidade é ótima!',
      'likes': 30,
    },
  ];

  final TextEditingController _textController = TextEditingController();

  void _addExperience() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        experiences.insert(0, { // Adiciona o novo card no topo da lista
          'name': 'VOCÊ',
          'text': _textController.text,
          'likes': 0,
        });
        _textController.clear(); // Limpa o campo de entrada após enviar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF7CB342),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Participe da nossa comunidade e troque experiências com pessoas que compartilham os mesmos interesses. Compartilhe suas histórias, dicas e aprendizados. Juntos, podemos crescer e nos apoiar em nossa jornada para uma vida mais saudável e equilibrada.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3A3A3A),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xFF7CB342)),
                    ),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Escreva aqui...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFF7CB342)), // Ícone de enviar
                  onPressed: _addExperience, // Função para adicionar novo card
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Experiências',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final experience = experiences[index];
                return ExperienceCard(
                  name: experience['name'],
                  text: experience['text'],
                  likes: experience['likes'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String name;
  final String text;
  final int likes;

  const ExperienceCard({
    required this.name,
    required this.text,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Color(0xFF7CB342), size: 20),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.thumb_up, color: Color(0xFF7CB342)),
              SizedBox(width: 4),
              Text('$likes'),
            ],
          ),
        ],
      ),
    );
  }
}
