import 'package:flutter/material.dart';
import 'package:imc_calculator/model/imc__model.dart';
import 'package:imc_calculator/repository/imc_repository.dart';

import '../shared/widgets/custom_textfield.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var imcRepository = IMCRepository();
  var _resultados = const <IMCModel>[];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterResultados();
  }

  //resgata os dados salvos
  void obterResultados() async {
    _resultados = await imcRepository.listar();
    setState(() {});
  }

//Limpa todos os dados salvos
  void limparHistorico() {
    setState(() {
      imcRepository.removeAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Limpar histórico",
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      limparHistorico();
                      obterResultados();
                    });
                  },
                  icon:
                      const Icon(Icons.dangerous, color: Colors.red, size: 40),
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: ListView.builder(
                itemCount: _resultados.length,
                itemBuilder: (BuildContext bc, int index) {
                  var resultado = _resultados[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person_2),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(resultado.nome.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.nine_k_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(resultado.peso.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.height_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(resultado.altura.toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(Icons.info),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(resultado.resultadoIMC.toString(),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calculate),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text("Calcular IMC"),
                content: Column(children: [
                  CustomTextField(
                    texto: "Nome",
                    icon: const Icon(Icons.person_2),
                    controller: _nomeController,
                  ),
                  CustomTextField(
                      texto: "Peso, exemplo: 60",
                      icon: const Icon(Icons.nine_k_outlined),
                      input: TextInputType.number,
                      controller: _pesoController),
                  CustomTextField(
                      texto: "Altura, exemplo: 160",
                      icon: const Icon(Icons.height_outlined),
                      input: TextInputType.number,
                      controller: _alturaController),
                ]),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar")),
                  TextButton(
                      onPressed: () async {
                        try {
                          await imcRepository.adicionar(
                            IMCModel(
                                _nomeController.text,
                                double.parse(_pesoController.text),
                                double.parse(_alturaController.text)),
                          );
                        } on Exception catch (e) {
                          return;
                        }
                        Navigator.pop(context);
                        setState(() {
                          _nomeController.text = '';
                          _pesoController.text = '';
                          _alturaController.text = '';
                        });
                      },
                      child: const Text("Salvar"))
                ],
              );
            },
          );
        },
      ),
    );
  }
}
