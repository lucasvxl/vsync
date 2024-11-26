import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dietas', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF7CB342),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Importante!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Antes de seguir qualquer dieta, é ideal consultar um nutricionista para orientações adequadas.',
              style: TextStyle(fontSize: 16, color: Color(0xFF3A3A3A)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  // Centralizamos o título dentro do ListView
                  Center(
                    child: Text(
                      'Tipos de Dietas',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DietCategory(
                    title: 'Dieta Hospitalar',
                    description:
                    'Pode ser normal, geral, branda, pastosa, líquida-pastosa, líquida, líquida completa ou líquida restrita.',
                  ),
                  DietCategory(
                    title: 'Dieta Vegana e Vegetariana',
                    description:
                    'Estilos de vida ou filosofias, não necessariamente dietas para emagrecer.',
                  ),
                  DietCategory(
                    title: 'Dieta Mediterrânea',
                    description:
                    'Baseada em alimentos in natura, como frutas, legumes, verduras e gorduras boas. É considerada uma das dietas mais saudáveis do mundo.',
                  ),
                  DietCategory(
                    title: 'Dieta Low Carb',
                    description:
                    'Tem como objetivo a redução de carboidratos.',
                  ),
                  DietCategory(
                    title: 'Dieta DASH',
                    description:
                    'Desenvolvida pelo Instituto Nacional do Coração, Pulmões e Sangue dos EUA, tem como objetivo reduzir e controlar a pressão arterial.',
                  ),
                  DietCategory(
                    title: 'Dieta Paleolítica',
                    description:
                    'Baseada na alimentação dos ancestrais, que consistia em carne de caça, pesca, frutas e vegetais.',
                  ),
                  DietCategory(
                    title: 'Dieta Cetogênica',
                    description:
                    'Tem como objetivo a perda de peso, e se baseia em uma alimentação com mais gordura e menos carboidratos.',
                  ),
                  DietCategory(
                    title: 'Dieta Dukan',
                    description:
                    'Criação do francês Pierre Dukan, tem como foco o consumo de proteínas.',
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

class DietCategory extends StatelessWidget {
  final String title;
  final String description;

  DietCategory({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFEDE7F6),
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
          ],
        ),
      ),
    );
  }
}
