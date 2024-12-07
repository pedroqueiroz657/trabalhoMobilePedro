import 'package:flutter/material.dart';
import 'dart:math';

class JogoMoeda extends StatefulWidget {
  const JogoMoeda({super.key});
  _JogoMoedaState createState() => _JogoMoedaState();
}

class _JogoMoedaState extends State<JogoMoeda> {
  var _imagemApp = "images/padrao.png";
  var _mensagem = "Escolha uma opção abaixo";
  var _resultado = "";
  var _resultadoJogo = "";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["cara", "coroa"];

    var _resultado = opcoes[Random().nextInt(2)];

    var escolhaApp = "";

    if (escolhaUsuario == "cara") {
      escolhaApp = "coroa";
    } else {
      escolhaApp = "cara";
    }

    _imagemApp = "images/" + escolhaApp + ".png";

    // Verifica o resultado
    if (escolhaUsuario == _resultado && escolhaApp != _resultado) {
      _mensagem = "Você ganhou!";
    } else {
      _mensagem = "Você perdeu!";
    }

    setState(() {
      _resultadoJogo = "A moeda foi jogada e caiu " + _resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cara Coroa",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(_imagemApp, height: 100),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("cara"),
                child: Image.asset('images/cara.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("coroa"),
                child: Image.asset('images/coroa.png', height: 100),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoJogo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
