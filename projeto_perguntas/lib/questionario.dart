import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  //recebe paramêtro do tipo
  final void Function(int) quandoResponder;

  const Questionario({
    Key? key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quandoResponder,
  }) : super(key: key);

  //get pra mostrar pergunta ou não
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //pegando as respostas da lista de perguntas
    //se não tiver pergunta selecionada, retorna vazio
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Questao(
          texto: perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        const SizedBox(
          height: 20,
        ),
        //o ... é um operador que vai fazer todos os elementos da lista
        //seja add nessa nova lista add na
        // ---- Maneira 1 de fazer ----
        // ...widgets,

        // ---- Maneira 2 de fazer ----
        // Pegou as respostas que é uma lista de String
        // Usou o map, pra transforma de lista do tipo String em uma lista do tipo Widget
        // Transforma o resultado do map em uma lista
        // usou o ... pra pegar cada item da lista de widgets e jogar nos children da Column

        ...respostas.map((resp) {
          return Resposta(
            resposta: resp['texto'].toString(),
            //passa o método () que chama o outro método 'quandoResponder'
            //passando uma função como parâmetro
            // o () seria o metodo do onPressed do widget Resposta
            quandoSelecionado: () =>
                //acessando a pontuacao
                quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
