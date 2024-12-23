import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/models/titulo.dart';
import 'package:flutter/material.dart';


class TimesRepository {
  final List<Time> _times = [];

  get times => this._times;

  void addTitulos(Time time, Titulo titulo){
    time.titulos.add(titulo);
  }

  TimesRepository() {
    _times.addAll([
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
        cor: Colors.red[900],
      ),
    ]);
  }

}