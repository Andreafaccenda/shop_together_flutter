import 'dart:ffi';

class ProdottiModel{
  String? id, nome,produttore,immagine,categoria, prezzo_unitario, quantita,descrizione,disponibilita,unita_ordinate;



  ProdottiModel({required this.id, required this.nome, required this.produttore,
    required this.immagine,required this.categoria,required this.prezzo_unitario,
    required this.quantita,required this.descrizione,required this.disponibilita,
    required this.unita_ordinate});

   ProdottiModel.fromJson(Map<dynamic, dynamic> map) {
     if (map == null) {
       return;
     }
      id = map['id'];
      nome = map['nome'];
      immagine = map['immagine'];
      produttore = map['produttore'];
      categoria= map['categoria'];
      prezzo_unitario=map['prezzo_unitario'];
      quantita=map['quantita'];
      descrizione=map['descrizione'];
      disponibilita=map['disponibilita'];
      unita_ordinate=map['unita_ordinate'];
  }

  toJson() {
    return {
      'id': id,
      'nome': nome,
      'immagine': immagine,
      'produttore': produttore,
      'categoria':categoria,
      'prezzo_unitario':prezzo_unitario,
      'quantita':quantita,
      'descrizione': descrizione,
      'disponibilita':disponibilita,
      'unita_ordinate':unita_ordinate,
    };
  }
}