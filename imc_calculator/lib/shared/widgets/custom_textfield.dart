import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final texto;
  final icon;
  final input;
  final controller;

  const CustomTextField({
    Key? key,
    required this.icon,
    this.texto,
    this.input,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: input,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 175, 13, 162))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 175, 13, 162))),
          hintText: texto,
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: icon),

      //controller: descricaoContoller,
    );
  }
}
