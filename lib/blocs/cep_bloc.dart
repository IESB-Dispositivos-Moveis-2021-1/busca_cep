
import 'package:busca_cep/models/cep_model.dart';
import 'package:busca_cep/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CepBloc { // BLoC = Business Layer of Component
  final _repository = Repository();

  final _cepFetcher = PublishSubject<CepModel>();
  final _loading = PublishSubject<bool>();

  Stream<CepModel> get lastFetchedAddress => _cepFetcher.stream;
  Stream<bool> get loading => _loading.stream;

  fetchAddress({required String byCep}) async {
    if (byCep.length == 8) {
      _loading.sink.add(true);
      final fetchedAddress = await _repository.fetchAddress(byCep);
      _loading.sink.add(false);
      _cepFetcher.sink.add(fetchedAddress);
    }
  }

  dispose() {
    _cepFetcher.close();
    _loading.close();
  }

}
