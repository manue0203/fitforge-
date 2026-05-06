import 'package:flutter/material.dart';
import 'seance.dart';
import 'detail_seance_page.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  String? groupeFiltre;
  String? niveauFiltre;

  @override
  Widget build(BuildContext context) {
    final seancesFiltres = seancesDisponibles.where((s) {
      final g = s.groupe.toLowerCase();
      final n = s.niveau.toLowerCase();

      final groupeOK = groupeFiltre == null || g == groupeFiltre!.toLowerCase();
      final niveauOK = niveauFiltre == null || n == niveauFiltre!.toLowerCase();

      return groupeOK && niveauOK;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue des séances"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          DropdownButton<String>(
            value: groupeFiltre,
            hint: const Text("Filtrer par groupe musculaire"),
            items: ["jambes", "dos", "abdos", "bras", "cardio", "épaules", "poitrine"]
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (value) {
              setState(() => groupeFiltre = value);
            },
          ),

          DropdownButton<String>(
            value: niveauFiltre,
            hint: const Text("Filtrer par niveau"),
            items: ["débutant", "intermédiaire", "avancé"]
                .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                .toList(),
            onChanged: (value) {
              setState(() => niveauFiltre = value);
            },
          ),

          const Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: seancesFiltres.length,
              itemBuilder: (context, index) {
                final s = seancesFiltres[index];
                return ListTile(
                  title: Text(s.nom),
                  subtitle: Text("${s.groupe} • ${s.duree} min • ${s.niveau}"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailSeancePage(seance: s),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
