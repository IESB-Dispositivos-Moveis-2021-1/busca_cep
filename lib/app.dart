
import 'package:busca_cep/ui/address_search.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData.fallback(),
        home: AddressSearch(),
      );
  }


}
