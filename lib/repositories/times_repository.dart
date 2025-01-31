import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/models/titulo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TimesRepository extends GetxController {
  final RxList times = <Time>[].obs;

  void addTitulos(Time time, Titulo titulo){
    time.titulos.add(titulo);
  }

  void editTitulo({required Titulo titulo, required String campeonato, required String ano}){
    titulo.campeonato = campeonato;
    titulo.ano = ano;
  }

  TimesRepository() {
    times.addAll(<Time>[
      Time(
        nome: 'Flamengo',
        pontos: 71,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Internacional',
        pontos: 69,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
        cor: Colors.red[900],
      ),
      Time(
        nome: 'Atlético-MG',
        pontos: 65,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
        cor: Colors.black,
      ),
    ]);
  }

}