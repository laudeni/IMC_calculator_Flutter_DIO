import 'package:flutter/material.dart';

class IMCModel {
  String _id = UniqueKey().toString();
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  String resultadoIMC = "";

  // Getters and Setters
  get getResultadoIMC => this.resultadoIMC;

  set setResultadoIMC(resultadoIMC) => this.resultadoIMC = resultadoIMC;

  IMCModel(this._nome, this._peso, this._altura);

  String get id => _id;
  get nome => _nome;

  set nome(nome) => _nome = nome;

  get peso => _peso;

  set peso(peso) => _peso = peso;

  get altura => _altura;

  set altura(altura) => _altura = altura;
}
