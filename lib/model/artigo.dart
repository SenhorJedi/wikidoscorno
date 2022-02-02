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
    required this.createDate,
    required this.visualizacao,
    required this.emailUsuario,
  });

  int id;
  String uuid;
  String titulo;
  String conteudo;
  String linguagem;
  String tag;
  int ativo;
  DateTime createDate;
  int visualizacao;
  String emailUsuario;

  factory Artigo.fromJson(Map<String, dynamic> json) => Artigo(
        id: json["id"],
        uuid: json["uuid"],
        titulo: json["titulo"],
        conteudo: json["conteudo"],
        linguagem: json["linguagem"],
        tag: json["tag"],
        visualizacao: json["visualizacao"],
        ativo: json["ativo"],
        createDate: DateTime.parse(json["create_date"]),
        emailUsuario: json["email_usuario"],
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
            "${createDate.year.toString().padLeft(4, '0')}-${createDate.month.toString().padLeft(2, '0')}-${createDate.day.toString().padLeft(2, '0')}",
      };
}
