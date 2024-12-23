import 'package:app_test_build/models/titulo.dart';
import 'package:flutter/material.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  Color? cor;
  List<Titulo> titulos = [];

  Time({required this.nome, required this.brasao, required this.pontos, this.cor});
}