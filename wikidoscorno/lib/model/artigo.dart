// To parse this JSON data, do
//
//     final artigo = artigoFromJson(jsonString);

import 'dart:convert';

List<Artigo> artigoFromJson(String str) =>
    List<Artigo>.from(json.decode(str).map((x) => Artigo.fromJson(x)));

String artigoToJson(List<Artigo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artigo {
  Artigo({
    required this.id,
    required this.uuid,
    required this.titulo,
    required this.conteudo,
    required this.linguagem,
    required this.tag,
  });

  int id;
  String uuid;
  String titulo;
  String conteudo;
  String linguagem;
  String tag;

  factory Artigo.fromJson(Map<String, dynamic> json) => Artigo(
        id: json["id"],
        uuid: json["uuid"],
        titulo: json["titulo"],
        conteudo: json["conteudo"],
        linguagem: json["linguagem"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "titulo": titulo,
        "conteudo": conteudo,
        "linguagem": linguagem,
        "tag": tag,
      };
}
