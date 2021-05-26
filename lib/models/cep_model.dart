// To parse this JSON data, do
//
//     final cepModel = cepModelFromJson(jsonString);

import 'dart:convert';

class CepModel {
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  factory CepModel.fromRawJson(String str) => CepModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
    cep: json["cep"] == null ? null : json["cep"],
    logradouro: json["logradouro"] == null ? null : json["logradouro"],
    complemento: json["complemento"] == null ? null : json["complemento"],
    bairro: json["bairro"] == null ? null : json["bairro"],
    localidade: json["localidade"] == null ? null : json["localidade"],
    uf: json["uf"] == null ? null : json["uf"],
    ibge: json["ibge"] == null ? null : json["ibge"],
    gia: json["gia"] == null ? null : json["gia"],
    ddd: json["ddd"] == null ? null : json["ddd"],
    siafi: json["siafi"] == null ? null : json["siafi"],
  );

  Map<String, dynamic> toJson() => {
    "cep": cep == null ? null : cep,
    "logradouro": logradouro == null ? null : logradouro,
    "complemento": complemento == null ? null : complemento,
    "bairro": bairro == null ? null : bairro,
    "localidade": localidade == null ? null : localidade,
    "uf": uf == null ? null : uf,
    "ibge": ibge == null ? null : ibge,
    "gia": gia == null ? null : gia,
    "ddd": ddd == null ? null : ddd,
    "siafi": siafi == null ? null : siafi,
  };
}
