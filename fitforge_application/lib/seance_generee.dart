import 'package:flutter/material.dart';
import 'seance.dart';


class SeanceGeneree extends StatelessWidget {
  final Seance seance;

  const SeanceGeneree({super.key, required this.seance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Séance générée")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(seance.nom, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Groupe : ${seance.groupe}"),
            Text("Durée : ${seance.duree} min"),
            Text("Niveau : ${seance.niveau}"),
            const SizedBox(height: 20),
            Text(seance.description),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Retour"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
