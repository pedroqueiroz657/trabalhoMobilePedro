import 'package:flutter/material.dart';
import 'gasolina.dart';
import 'frases.dart';
import 'menuJogos.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _abrirGasolina() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Consumo(),
        ));
  }

  void _abrirFrase() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Frase(),
        ));
  }

  void _abrirMenuJogos() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuJogos(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
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
                          _abrirGasolina();
                        },
                        child: Image.asset("images/gasolina.png")),
                    GestureDetector(
                        onTap: () {
                          _abrirFrase();
                        },
                        child: Image.asset("images/livro.png")),
                    GestureDetector(
                        onTap: () {
                          _abrirMenuJogos();
                        },
                        child: Image.asset("images/controle.png")),
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
