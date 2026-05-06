import 'dart:convert';
import 'package:flutter/services.dart';

class Seance {
  final int id;
  final String nom;
  final String description;
  final String groupe;
  final int duree;
  final String niveau;

  Seance({
    required this.id,
    required this.nom,
    required this.description,
    required this.groupe,
    required this.duree,
    required this.niveau,
  });

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      groupe: json['groupe'].toString().toLowerCase(),   
      duree: json['duree'],
      niveau: json['niveau'].toString().toLowerCase(),   
    );
  }
}


List<Seance> seancesDisponibles = [];

/// Fonction pour charger le fichier JSON
Future<void> chargerSeancesDepuisJson() async {
  final data = await rootBundle.loadString('assets/exercices.json');
  final List<dynamic> jsonList = json.decode(data);

  seancesDisponibles = jsonList.map((e) => Seance.fromJson(e)).toList();
}
