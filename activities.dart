import 'package:flutter/material.dart';
import 'package:vitasync/personalized.dart';
import 'package:vitasync/aerobic.dart';
import 'package:vitasync/anaerobic.dart';
import 'package:vitasync/balance.dart';
import 'package:vitasync/flexibility.dart';
import 'package:vitasync/stretching.dart';
import 'package:vitasync/mobility.dart';

void main() {
  runApp(VitasyncApp());
}

class VitasyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivitiesScreen(),
    );
  }
}

class ActivitiesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> activities = [
    {'icon': Icons.star, 'title': 'Personalizado'},
    {'icon': Icons.directions_run, 'title': 'Aeróbicos'},
    {'icon': Icons.self_improvement, 'title': 'Alongamento'},
    {'icon': Icons.fitness_center, 'title': 'Anaeróbicos'},
    {'icon': Icons.balance, 'title': 'Equilíbrio'},
    {'icon': Icons.accessibility_new, 'title': 'Flexibilidade'},
    {'icon': Icons.directions_walk, 'title': 'Mobilidade'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7CB342),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Treinos'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: activities.map((activity) {
            return Container(
              margin: activity['title'] == 'Personalizado' ? EdgeInsets.only(bottom: 5, top: 5) : EdgeInsets.zero,
              padding: activity['title'] == 'Personalizado' ? EdgeInsets.symmetric(vertical: 8.0) : EdgeInsets.zero,
              alignment: Alignment.center,
              child: Card(
                color: Color(0xFFEDE7F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListTile(
                  leading: Icon(activity['icon'], color: Color(0xFF7CB342), size: 30),
                  title: Text(
                    activity['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 16),
                  onTap: () {
                    // Redireciona para a tela apropriada
                    if (activity['title'] == 'Personalizado') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalizedActivitiesScreen()),
                      );
                    } else if (activity['title'] == 'Aeróbicos') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AerobicsScreen(onStartExercise: (String ) {  },)),
                      );
                    } else if (activity['title'] == 'Alongamento') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StretchingScreen(onStartExercise: (String ) {  },)),
                      );
                    } else if (activity['title'] == 'Anaeróbicos') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnaerobicsScreen(onStartExercise: (String ) {  },)),
                      );
                    } else if (activity['title'] == 'Equilíbrio') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BalanceScreen(onStartExercise: (String ) {  },)),
                      );
                    } else if (activity['title'] == 'Flexibilidade') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlexibilityScreen(onStartExercise: (String ) {  },)),
                      );
                    } else if (activity['title'] == 'Mobilidade') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MobilityScreen(onStartExercise: (String ) {  },)),
                      );
                    }
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
