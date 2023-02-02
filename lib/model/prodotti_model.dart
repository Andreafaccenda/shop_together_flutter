import 'dart:ffi';

class ProdottiModel{
  String? id, nome,produttore,immagine,categoria;

  ProdottiModel({required this.id, required this.nome, required this.produttore,required this.immagine,required this.categoria});

   ProdottiModel.fromJson(Map<dynamic, dynamic> map) {
     if (map == null) {
       return;
     }
      id = map['id'];
      nome = map['nome'];
      immagine = map['immagine'];
      produttore = map['produttore'];
      categoria= map['categoria'];
  }

  toJson() {
    return {
      'id': id,
      'nome': nome,
      'immagine': immagine,
      'produttore': produttore,
      'categoria':categoria,
    };
  }
}