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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FITFORGE',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue dans FitForge, votre application pour créer des séances d\'entraînement personnalisées. Sélectionnez vos critères pour découvrir les exercices adaptés à vos besoins.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Groupe
            DropdownButton<String>(
              value: groupe,
              hint: const Text("Choisir un groupe"),
              items: ["Pectoraux", "Dos", "Jambes", "Bras"].map((m) {
                return DropdownMenuItem(value: m, child: Text(m));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  groupe = value;
                });
              },
            ),

            // Durée
            DropdownButton<int>(
              value: duree,
              hint: const Text("Durée (minutes)"),
              items: [10, 20, 30, 45].map((d) {
                return DropdownMenuItem(value: d, child: Text("$d min"));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  duree = value;
                });
              },
            ),

            // Niveau
            DropdownButton<String>(
              value: niveau,
              hint: const Text("Niveau"),
              items: ["Débutant", "Intermédiaire", "Avancé"].map((i) {
                return DropdownMenuItem(value: i, child: Text(i));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  niveau = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Bouton pour générer la séance choisie
            ElevatedButton(
              onPressed: () {
                if (groupe != null && duree != null && niveau != null) {

                  // On cherche une séance correspondant aux critères
                  final seanceGeneree = seancesDisponibles.firstWhere(
                    (s) =>
                        s.groupe == groupe &&
                        s.duree == duree &&
                        s.niveau == niveau,
                    orElse: () => Seance(
                      id: 0,
                      nom: "Aucune séance trouvée",
                      description: "Aucune séance ne correspond à vos critères.",
                      groupe: groupe!,
                      duree: duree!,
                      niveau: niveau!,
                    ),
                  );

                  // Navigation vers l'écran final pour générer la séance
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeanceGeneree(seance: seanceGeneree),
                    ),
                  );
                }
              },
              child: const Text("Générer la séance"),
            ),

// Bouton pour voir le catalogue des séances
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CataloguePage()),
                );
              },
              child: const Text("Voir le catalogue"),
            ),
          ],
        ),
      ),
    );
  }
}
