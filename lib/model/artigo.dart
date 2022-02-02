// To parse this JSON data, do
//
//     final artigo = artigoFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

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
    required this.ativo,
    required this.create_date,
    required this.visualizacao,
  });

  int id;
  String uuid;
  String titulo;
  String conteudo;
  String linguagem;
  String tag;
  int ativo;
  DateTime create_date;
  int visualizacao;

  factory Artigo.fromJson(Map<String, dynamic> json) => Artigo(
        id: json["id"],
        uuid: json["uuid"],
        titulo: json["titulo"],
        conteudo: json["conteudo"],
        linguagem: json["linguagem"],
        tag: json["tag"],
        visualizacao: json["visualizacao"],
        ativo: json["ativo"],
        create_date: DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "titulo": titulo,
        "conteudo": conteudo,
        "linguagem": linguagem,
        "tag": tag,
        "visualizacao": visualizacao,
        "ativo": ativo,
        "create_date":
            "${create_date.year.toString().padLeft(4, '0')}-${create_date.month.toString().padLeft(2, '0')}-${create_date.day.toString().padLeft(2, '0')}",
      };
}
