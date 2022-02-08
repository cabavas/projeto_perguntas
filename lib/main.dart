import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Branco'],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Ornitorrinco', 'Elefante', 'Avestruz', 'Baiacú'],
    },
    {
      'texto': 'Qual seu filme favorito?',
      'respostas': [
        'Senhor dos aneis',
        'Star wars',
        'Power Rangers',
        'O grande mestre'
      ],
    }
  ];
  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Column(children: [
              Questao(_perguntas[perguntaSelecionada]['texto'].toString()),
              ...respostas.map((t) => Resposta(t, responder)).toList(),
            ])
          : Center(
              child: Text(
                'Parabéns!',
                style: TextStyle(fontSize: 28),
              ),
            ),
    ));
  }
}
