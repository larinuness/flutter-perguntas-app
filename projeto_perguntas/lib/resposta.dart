import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() quandoSelecionado;
  const Resposta({Key? key, required this.resposta, required this.quandoSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      width: 170,
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(resposta),
      ),
    );
  }
}
