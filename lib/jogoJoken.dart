import 'dart:math';
import 'package:flutter/material.dart';

class JogoJoken extends StatefulWidget {
  @override
  _JogoJokenState createState() => _JogoJokenState();
}

class _JogoJokenState extends State<JogoJoken> {
  var _mensagem = "Escolha uma opção abaixo";
  var _imagemApp = "images/padrao.png";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[Random().nextInt(3)];

    _imagemApp = "images/" + escolhaApp + ".png";

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      _mensagem = "Você ganhou!";
    } else if (escolhaUsuario == escolhaApp) {
      _mensagem = "Empate!";
    } else {
      _mensagem = "Você perdeu!";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
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
          Image.asset(_imagemApp, height: 100), // Imagem da escolha do app
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
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('images/tesoura.png', height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
