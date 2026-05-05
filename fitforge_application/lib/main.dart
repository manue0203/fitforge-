import 'package:flutter/material.dart';
import 'seance.dart';
import 'seance_generee.dart';
import 'catalogue_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercices FitForge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Bienvenue sur FitForge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? groupe;
  int? duree;
  String? niveau;

  // Widget pour styliser les Dropdowns
  Widget buildDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(hint),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 🔥 Fond gris clair
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'FITFORGE',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Bienvenue dans FitForge, votre application pour créer des séances d\'entraînement personnalisées. Sélectionnez vos critères pour découvrir les exercices adaptés à vos besoins.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              // 🔵 Groupe
              buildDropdown<String>(
                value: groupe,
                hint: "Choisir un groupe",
                items: ["Pectoraux", "Dos", "Jambes", "Bras"],
                onChanged: (value) => setState(() => groupe = value),
              ),

              // 🔵 Durée
              buildDropdown<int>(
                value: duree,
                hint: "Durée (minutes)",
                items: [10, 20, 30, 45],
                onChanged: (value) => setState(() => duree = value),
              ),

              // 🔵 Niveau
              buildDropdown<String>(
                value: niveau,
                hint: "Niveau",
                items: ["Débutant", "Intermédiaire", "Avancé"],
                onChanged: (value) => setState(() => niveau = value),
              ),

              const SizedBox(height: 20),

              // 🔵 Bouton générer
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (groupe != null && duree != null && niveau != null) {
                    final seanceGeneree = seancesDisponibles.firstWhere(
                      (s) =>
                          s.groupe == groupe &&
                          s.duree == duree &&
                          s.niveau == niveau,
                      orElse: () => Seance(
                        id: 0,
                        nom: "Aucune séance trouvée",
                        description:
                            "Aucune séance ne correspond à vos critères.",
                        groupe: groupe!,
                        duree: duree!,
                        niveau: niveau!,
                      ),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeanceGeneree(seance: seanceGeneree),
                      ),
                    );
                  }
                },
                child: const Text("Générer la séance"),
              ),

              const SizedBox(height: 10),

              // 🔵 Bouton catalogue
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CataloguePage()),
                  );
                },
                child: const Text("Voir le catalogue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
