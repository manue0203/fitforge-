import 'dart:convert';
import 'package:flutter/services.dart';
import 'seance.dart';

Future<List<Seance>> fetchSeances() async{
    // Charger le contenu brut du fichier
    final String response =await rootBundle.loadString('assets/seance.json');
    //Décoder le JSON en Map dart 
    final Map<String, dynamic> data = jsonDecode(response);
    //Extraire la liste des séances
    final List<dynamic> seancesJson = data['seances'];
    //Convertir chaque élément de la liste en objet Seance
    return seancesJson.map((item)=> Seance.fromJson(item)).toList();
}