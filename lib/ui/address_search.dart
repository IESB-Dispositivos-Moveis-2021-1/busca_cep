

import 'package:busca_cep/blocs/cep_bloc.dart';
import 'package:busca_cep/models/cep_model.dart';
import 'package:flutter/material.dart';


class AddressSearch extends StatelessWidget {

  final _bloc = CepBloc();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _controller.addListener(() {
      _bloc.fetchAddress(byCep: _controller.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa CEP'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                    labelText: 'Digite o CEP para encontrar o endereço',
                    hintText: '00000000',
                    helperText: 'somente números'
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.transparent
                )
              ),
              child: StreamBuilder(
                stream: _bloc.lastFetchedAddress,
                builder: (context, AsyncSnapshot<CepModel> snapshot) {
                  if (snapshot.hasData) {
                    final address = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cidade: ${address.localidade}'),
                        Text('Estado: ${address.uf}'),
                        Text('Bairro: ${address.bairro}'),
                        Text('Logradouro: ${address.logradouro}'),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Ocorreu um erro!\n${snapshot.error}');
                  }

                  return StreamBuilder(
                    stream: _bloc.loading,
                    builder: (ctx, AsyncSnapshot<bool> snapshot) {
                      final loading = snapshot.data ?? false;
                      if (loading) {
                        return Center(child: CircularProgressIndicator());
                      }else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            )


          ],
        ),
      ),
    );
  }

}
