// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_encoder/url_encoder.dart';
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/model/artigo.dart';

class ApiProvider {
  final String authority = 'gestor.rjinformatica.net.br';
  static const int pageSize = 20;
  static const String orderBy = 'titulo';
  static const String ordemTipo = 'asc';

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
    String params = urlEncode(
        text:
            '?size=$pagesize&page=$page&ordem=$orderby&ordemtp=$ordemtipo&pesquisasrc=${search.trim()}');

    try {
      var response = await http
          .get(Uri.https(authority, unencodedPath + params))
          .timeout(const Duration(seconds: 60));

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
