import 'package:http/http.dart' as http;

class Provider {
  final String authority = 'gestor.rjinformatica.net.br';

  getTodosArtigos() {
    const String unencodedPath = '/api/v1/wiki/artigo';
    http.get(Uri.https(authority, unencodedPath));
  }
}
