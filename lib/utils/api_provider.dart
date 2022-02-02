// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/model/artigo.dart';
import 'package:wikidoscorno/model/pages.dart';

class ApiProvider {
  final String authority = 'gestor.rjinformatica.net.br';
  static const int pageSize = 3;
  static const String orderBy = 'titulo';
  static const String ordemTipo = 'asc';

  String urlEncode(String text) {
    String output = text;

    var detectHash = text.contains('#');
    var detectAnd = text.contains('&');
    var detectSlash = text.contains('/');

    if (detectHash == true) {
      output = output.replaceAll('#', '%23');
    }

    if (detectAnd == true) {
      output = output.replaceAll('#', '%26');
    }

    if (detectSlash == true) {
      output = output.replaceAll('#', '%2F');
    }

    return output;
  }

  Future<ResultApiArtigo> getTodosArtigos({
    int page = 1,
    String search = '',
    String orderby = orderBy,
    String ordemtipo = ordemTipo,
    int pagesize = pageSize,
    int ativo = 1,
  }) async {
    List<Artigo> artigos = [];
    List<Pages> paginas = [];
    int maxpage = 0;
    String statuscode = '';
    String responsebody = '';

    const String unencodedPath = '/api/v1/wiki/artigo';
    Map<String, String> params = {
      'size': pagesize.toString(),
      'page': page.toString(),
      'ordem': orderby,
      'ordemtp': ordemtipo,
      'pesquisasrc': search.trim(),
      'ativo': ativo.toString(),
    };

    try {
      var response = await http
          .get(
            Uri.https(
              authority,
              unencodedPath,
              params,
            ),
          )
          .timeout(const Duration(seconds: 60));
      responsebody = response.body;
      var decoded = json.decode(response.body);

      artigos = List<Artigo>.from(
        json.decode(response.body)["data"].map((x) => Artigo.fromJson(x)),
      );

      try {
        paginas = List<Pages>.from(
          json.decode(response.body)["links"].map((x) => Pages.fromJson(x)),
        );

        //print(paginas.toString());
        for (var element in paginas) {
          element.label = element.label
              .toString()
              .replaceAll('&laquo; Previous', 'Anterior');
          element.label =
              element.label.toString().replaceAll('Next &raquo;', 'Proxima');

          print(element.toJson());
        }
      } catch (e) {
        print('Erro ao montar paginas: $e');
        print(decoded["links"]);
      }

      maxpage = decoded["last_page"];
    } catch (e) {
      statuscode = 'Erro ao buscar! $e';
      print('ERRO = $e');
      print('RESPONSE BODY = $responsebody');
      print('PARAMS = $params');
    }

    return ResultApiArtigo(
      artigos,
      statuscode,
      maxpage,
      paginas,
    );
  }

  Future<String> insertArtigo({
    required String titulo,
    required String conteudo,
    required String linguagem,
    required String tag,
    required String email,
    int ativo = 2,
  }) async {
    String res = '';

    const String unencodedPath = '/api/v1/wiki/artigo';

    var values = <String, dynamic>{
      'titulo': titulo,
      'conteudo': conteudo,
      'linguagem': linguagem,
      'tag': tag,
      'email_usuario': email,
      'ativo': ativo,
    };

    try {
      var response = await http
          .post(
            Uri.https(authority, unencodedPath),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(values),
          )
          .timeout(const Duration(seconds: 60));

      res = response.body;
    } catch (e) {
      res = 'Erro ao Salvar! $e';
      print(e);
      print(values);
    }

    return res;
  }
}
