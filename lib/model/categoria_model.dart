
class CategoriaModel{
    String? categoria, immagine;

    CategoriaModel({required this.categoria, required this.immagine});

    CategoriaModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
    return;
    }
    categoria = map['categoria'];
    immagine = map['immagine'];
    }


    toJson() {
      return {
        'categoria': categoria,
        'immagine': immagine,
      };
    }
}