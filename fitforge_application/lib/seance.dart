class Seance{
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
        required this.niveau
    });

    factory Seance.fromJson(Map<String, dynamic> json) {
        return Seance(
            id: json['id'],
            nom: json['nom'],
            description: json['description'],
            groupe: json['groupe'],
            duree: json['duree'],
            niveau: json['niveau']
        );
    }
}
    List<Seance> seancesDisponibles = [
  Seance(
    id: 1,
    nom: "Séance Pectoraux Débutant",
    description: "Séance simple pour débuter.",
    groupe: "Pectoraux",
    duree: 20,
    niveau: "Débutant",
  ),
  Seance(
    id: 2,
    nom: "Séance Dos Intermédiaire",
    description: "Travail complet du dos.",
    groupe: "Dos",
    duree: 30,
    niveau: "Intermédiaire",
  ),
];

