import 'package:flutter/material.dart';
import 'package:trabalho/jogoCaraCoroa.dart';
import 'jogoJoken.dart';
import 'JogoPar.dart';

class MenuJogos extends StatefulWidget {
  const MenuJogos({super.key});
  _MenuJogosState createState() => _MenuJogosState();
}

class _MenuJogosState extends State<MenuJogos> {
  void _abrirJoken() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JogoJoken(),
        ));
  }

  void _abrirMoeda() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JogoMoeda(),
        ));
  }

  void _abrirParImpa() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParImparGame(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu de Jogos",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Faça sua Escolha",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          _abrirJoken();
                        },
                        child: Image.asset("images/logoJoken.png")),
                    GestureDetector(
                        onTap: () {
                          _abrirMoeda();
                        },
                        child: Image.asset("images/cara.png")),
                    GestureDetector(
                        onTap: () {
                          _abrirParImpa();
                        },
                        child: Image.asset("images/numeros.png")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
