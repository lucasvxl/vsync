import 'dart:async';
import 'package:flutter/material.dart';
import 'reportscreen.dart'; // Importando a tela de relatórios

class ExerciseDetailScreen extends StatefulWidget {
  final String exercise;
  final Function(String) onStartExercise;

  ExerciseDetailScreen({required this.exercise, required this.onStartExercise});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  Stopwatch _stopwatch = Stopwatch();
  String _timerText = "00:00";

  void _startTimer() {
    widget.onStartExercise(widget.exercise); // Registra o exercício no histórico
    _stopwatch.start();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          _timerText = _stopwatch.elapsed.inMinutes.toString().padLeft(2, '0') +
              ":" +
              (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch.stop();
  }

  void _resetTimer() {
    setState(() {
      _stopwatch.reset();
      _timerText = "00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise),
        backgroundColor: Color(0xFF7CB342),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timerText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Começar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text('Parar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Resetar'),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Quando o exercício terminar, redireciona para a tela de relatório
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportScreen(
                      exercise: widget.exercise,
                      duration: _timerText,
                    ),
                  ),
                );
              },
              child: Text('Finalizar Exercício'),
              style: ElevatedButton.styleFrom(foregroundColor: Color(0xFF7CB342)),
            ),
          ],
        ),
      ),
    );
  }
}
