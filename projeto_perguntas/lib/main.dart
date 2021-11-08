import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

//State<nome> o nome do componente que vai controlar o estado
class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  //Uma lista de mapa que tem objetos dentro
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      //Uma lista de respostas
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 2},
        {'texto': 'Vermelho', 'pontuacao': 4},
        {'texto': 'Branco', 'pontuacao': 6},
        {'texto': 'Lilás', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      //Uma lista de respostas
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 2},
        {'texto': 'Cabra', 'pontuacao': 4},
        {'texto': 'Jacaré', 'pontuacao': 6},
        {'texto': 'Girafa', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu jogo favorito?',
      //Uma lista de respostas
      'respostas': [
        {'texto': 'League of Legends', 'pontuacao': 2},
        {'texto': 'Counter Strike', 'pontuacao': 4},
        {'texto': 'Dota 2', 'pontuacao': 6},
        {'texto': 'Call of Duty', 'pontuacao': 8},
      ],
    },
  ];
  //Calculando a pontuação
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        //Mostrando próxima pergunta
        _perguntaSelecionada++;
        //Acrescentando a pontuação
        _pontuacaoTotal += pontuacao;
      });
    }
    // ignore: avoid_print
    // print(_perguntaSelecionada);
    // ignore: avoid_print
    print(_pontuacaoTotal);
  }

  //Get pra mostrar pergunta ou não
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ---- FORMA DECLARATIVA ----

    //transforma a list de respostas em Widgets
    //função do map é transformar as coisas, uma lista pra um outro tipo de lista
    // List<Widget> widgets = respostas
    //     .map((texto) => Resposta(resposta: texto, selecionado: _responder))
    //     .toList();

    // ---- FORMA IMPERATIVA ----

    //add as respostas na lista de respostas de acorda com a questão que está
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(resposta: textoResp, selecionado: _responder));
    // }

    //uma instancia, poderia usar o new = return new MaterialApp
    //contexto de construção
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //cor padrão do projeto
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App de Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder)
            //senão tiver mais perguntas, vai mostrar isso
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}
