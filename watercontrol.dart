import 'package:flutter/material.dart';

void main() {
  runApp(VitasyncWater());
}

class VitasyncWater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HydrationScreen(),
    );
  }
}

class HydrationScreen extends StatefulWidget {
  @override
  _HydrationScreenState createState() => _HydrationScreenState();
}

class _HydrationScreenState extends State<HydrationScreen> {
  double peso = 0;
  double altura = 0;
  double totalAgua = 0;
  double aguaAte14 = 0;
  double aguaAte22 = 0;

  // Função para abrir o diálogo onde o usuário insere peso e altura
  void _openWeightHeightDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Insira seu peso!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    peso = double.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(hintText: 'Peso (kg)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Fechar o diálogo
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Fazer o cálculo ao pressionar "Salvar"
                setState(() {
                  totalAgua = peso * 35; // Fórmula de cálculo de água
                  aguaAte14 = totalAgua / 2;
                  aguaAte22 = totalAgua / 2;
                });
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7CB342),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Ação ao clicar no botão de voltar
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        title: Text('Controle de Água'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20), // Espaço no topo
            Container(
              child: Center(
                child: Text(
                  'Nessa seção será possível analisar a quantidade total de água que deverá ser ingerida ao longo do dia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Botão Calcular
            ElevatedButton(
              onPressed: _openWeightHeightDialog, // Chama a função de abrir o diálogo
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Resultados do cálculo (aparecem abaixo do botão)
            _buildResultCard('Quantidade total de água', '$totalAgua mL'),
            SizedBox(height: 10),
            _buildResultCard('Até as 14h', '$aguaAte14 mL'),
            SizedBox(height: 10),
            _buildResultCard('Até as 22h', '$aguaAte22 mL'),
          ],
        ),
      ),
    );
  }

  // Agora os resultados estão em uma coluna
  Widget _buildResultCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3A3A3A),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7CB342),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
