import 'package:flutter/material.dart';
import 'seance.dart';

class DetailSeancePage extends StatelessWidget {
  final Seance seance;

  const DetailSeancePage({super.key, required this.seance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(seance.nom)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Groupe : ${seance.groupe}", style: const TextStyle(fontSize: 18)),
            Text("Durée : ${seance.duree} min", style: const TextStyle(fontSize: 18)),
            Text("Niveau : ${seance.niveau}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(seance.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
