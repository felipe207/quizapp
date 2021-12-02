// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCerta = helper.obterRespostaCorreta();
    if (respostaSelecionadaPeloUsuario == respostaCerta) {
      setState(() {
        //  marcadorDePontos.add(Icon(Icons.check, color: Colors.green));
        Fluttertoast.showToast(
            msg: "Acertou!!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 1);
      });
    } else {
      setState(() {
        //  marcadorDePontos.add(Icon(Icons.close, color: Colors.red));
        Fluttertoast.showToast(
            msg: "Errou!!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }

    setState(() {
      helper.proximaPergunta();
      // marcadorDePontos.add(Icon(Icons.check, color: Colors.green));
    });
  }

  // List<bool> respostas = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
                textColor: Colors.white,
                color: Colors.deepPurple,
                child: Text(
                  'Verdadeiro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  conferirResposta(true);
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.grey.shade800,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}

/*
pergunta1: 'O metrô é um dos meios de transporte mais seguros do mundo', verdadeiro,
pergunta2: 'A culinária brasileira é uma das melhores do mundo.', verdadeiro,
pergunta3: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', falso,
*/