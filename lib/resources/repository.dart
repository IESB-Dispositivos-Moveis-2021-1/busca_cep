
import 'package:busca_cep/models/cep_model.dart';
import 'package:busca_cep/resources/cep_api_provider.dart';

class Repository {
  final cepApiProvider = CepApiProvider();

  Future<CepModel> fetchAddress(String cep) => cepApiProvider.fetchAddress(cep);


}
