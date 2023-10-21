import 'package:imc_calculator/model/imc__model.dart';

class IMCRepository {
  final List<IMCModel> _pessoas = [];

  String resultadoIMC(double peso, altura) {
    altura = altura / 100;
    var imc = peso / (altura * altura);
    var resultado = "";

    if (imc < 16) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Magreza Grave!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!";
      // print(
      //     "Seu IMC é de: $imc \nVocê apresenta Magreza Grave!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!");
    } else if (imc > 16.0 && imc < 17.0) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Magreza Moderada!\nRecomendamos que busque auxilio de um profissional qualificadopara mais detalhes!";
      // print(
      //     "Seu IMC é de: $imc \nVocê apresenta Magreza Moderada!\nRecomendamos que busque auxilio de um profissional qualificadopara mais detalhes!");
    } else if (imc > 17 && imc < 18.5) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Magreza Leve!";
      // print("Seu IMC é de: $imc \nVocê apresenta Magreza Leve!");
    } else if (imc > 18.5 && imc < 25) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê está Saúdavel!";
      // print("Seu IMC é de: $imc \nVocê está Saúdavel!");
    } else if (imc > 25 && imc < 30) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Sobrepeso!";
      // print("Seu IMC é de: $imc \nVocê apresenta Sobrepeso!");
    } else if (imc > 30 && imc < 35) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Obsesidade Grau I!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!";
      // print(
      //     "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau I!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!");
    } else if (imc > 35 && imc < 40) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Obsesidade Grau II (Severa)!\nRecomendamos que busque auxilio de um profissional qualificadopara mais detalhes!";
      // print(
      //     "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau II (Severa)!\nRecomendamos que busque auxilio de um profissional qualificadopara mais detalhes!");
    } else if (imc > 40) {
      resultado =
          "Seu IMC é de: ${imc.toStringAsFixed(2)} \nVocê apresenta Obsesidade Grau III (Grave)!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!";
      // print(
      //     "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau III (Grave)!\nRecomendamos que busque auxilio de um profissional qualificado para mais detalhes!");
    }
    return resultado;
  }

  Future<void> adicionar(IMCModel pessoa) async {
    await Future.delayed(const Duration(seconds: 1));
    resultadoIMC(pessoa.peso, pessoa.altura);
    pessoa.resultadoIMC = resultadoIMC(pessoa.peso, pessoa.altura);
    _pessoas.add(pessoa);
  }

  Future<List<IMCModel>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));

    return _pessoas;
  }

  Future<void> removeAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _pessoas.clear();
  }
}
