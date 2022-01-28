// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/model/artigo.dart';

class ApiProvider {
  final String authority = 'gestor.rjinformatica.net.br';
  static const int pageSize = 20;
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
  }) async {
    List<Artigo> artigos = [];
    int maxpage = 0;
    String statuscode = '';

    const String unencodedPath = '/api/v1/wiki/artigo';
    var params = {
      'size': pagesize,
      'page': page,
      'ordem': orderby,
      'ordemtp': ordemtipo,
      'pesquisasrc': search.trim(),
    };

    try {
      var response = await http
          .get(
            Uri.https(
              authority,
              unencodedPath,
              {
                'size': pagesize,
                'page': page,
                'ordem': orderby,
                'ordemtp': ordemtipo,
                'pesquisasrc': search.trim(),
              },
            ),
          )
          .timeout(const Duration(seconds: 60));

      print('ESTOU PROVIDER');
      print(response);

      var decoded = json.decode(response.body);

      artigos = List<Artigo>.from(
          json.decode(response.body)["data"].map((x) => Artigo.fromJson(x)));

      maxpage = decoded["last_page"];
    } catch (e) {
      statuscode = '$e';
      print(e);
    }

    return ResultApiArtigo(
      artigos,
      statuscode,
      maxpage,
    );
  }
}
