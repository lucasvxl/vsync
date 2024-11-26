import 'package:flutter/material.dart';

void main() {
  runApp(VitaSyncProfileApp());
}

class VitaSyncProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VitaSyncProfile(),
    );
  }
}

class VitaSyncProfile extends StatefulWidget {
  @override
  _VitaSyncProfileState createState() => _VitaSyncProfileState();
}

class _VitaSyncProfileState extends State<VitaSyncProfile> {
  bool showProfile = true;
  bool showVaccines = false;
  String name = '';
  String gender = 'PREFIRO NÃO INFORMAR';
  String birthDate = '';
  String height = '';
  String weight = '';
  String vaccineName = '';
  String vaccineDate = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController vaccineNameController = TextEditingController();
  final TextEditingController vaccineDateController = TextEditingController();
  final TextEditingController errorController = TextEditingController();

  void toggleProfileView() {
    setState(() {
      showProfile = !showProfile;
      showVaccines = false;
    });
  }

  void toggleVaccinesView() {
    setState(() {
      showVaccines = !showVaccines;
      showProfile = false;
    });
  }

  void updateProfile() {
    setState(() {
      name = nameController.text.isNotEmpty ? nameController.text : '';
      birthDate = birthDateController.text;
      height = heightController.text;
      weight = weightController.text;
    });
  }

  void updateVaccines() {
    setState(() {
      vaccineName = vaccineNameController.text;
      vaccineDate = vaccineDateController.text;
    });
  }

  void submitError() {
    final error = errorController.text;
    if (error.isNotEmpty) {
      print('Erro enviado: $error');
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, descreva o erro')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            if (showProfile) ...[
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF3A3A3A),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                name.isNotEmpty ? name : 'NOME',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A3A3A),
                ),
              ),
              SizedBox(height: 32),
            ],
            ButtonTile(label: 'Dados', onPressed: toggleProfileView),
            if (!showProfile && !showVaccines) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    TextField(controller: nameController, decoration: InputDecoration(labelText: 'Nome')),
                    TextField(controller: birthDateController, decoration: InputDecoration(labelText: 'Data de Nascimento')),
                    TextField(controller: heightController, decoration: InputDecoration(labelText: 'Altura')),
                    TextField(controller: weightController, decoration: InputDecoration(labelText: 'Peso')),
                    SizedBox(height: 16),
                    ElevatedButton(onPressed: updateProfile, child: Text('Salvar')),
                  ],
                ),
              ),
            ],
            ButtonTile(label: 'Vacinas', onPressed: toggleVaccinesView),
            if (showVaccines) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    TextField(controller: vaccineNameController, decoration: InputDecoration(labelText: 'Nome da Vacina')),
                    TextField(controller: vaccineDateController, decoration: InputDecoration(labelText: 'Data da Vacina')),
                    SizedBox(height: 16),
                    ElevatedButton(onPressed: updateVaccines, child: Text('Salvar')),
                  ],
                ),
              ),
            ],
            ButtonTile(label: 'Histórico de exercícios'),
            ButtonTile(label: 'Gadgets'),
            ButtonTile(label: 'Ajuda'),
            ButtonTile(label: 'Relógio'),

            // Botão "Reportar Erros" sempre visível
            ButtonTile(
              label: 'Reportar Erros',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Reportar Erros'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: errorController,
                          decoration: InputDecoration(labelText: 'Descreva o erro'),
                          maxLines: 4,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(onPressed: submitError, child: Text('Enviar')),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTile extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const ButtonTile({required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF7CB342),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3A3A3A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
