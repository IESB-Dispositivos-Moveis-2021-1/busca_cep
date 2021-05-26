
import 'dart:convert';
import 'dart:developer';

import 'package:busca_cep/models/cep_model.dart';
import 'package:http/http.dart';

class CepApiProvider {
  final client = Client();

  Future<CepModel> fetchAddress(String cep) async {
    final response = await client.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      final body = response.body;
      log('Chegou o JSON: $body');
      final decodedJson = json.decode(body);
      return CepModel.fromJson(decodedJson);
    }else {
      throw Exception('Erro ao recuperar endereço. Status: ${response.statusCode}');
    }
  }

}
