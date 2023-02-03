import 'dart:ffi';

class ProdottiModel{
  String? id, nome,produttore,immagine,categoria, prezzo_unitario, quantita,descrizione;



  ProdottiModel({required this.id, required this.nome, required this.produttore,
    required this.immagine,required this.categoria,required this.prezzo_unitario,
    required this.quantita,required this.descrizione});

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
    };
  }
}