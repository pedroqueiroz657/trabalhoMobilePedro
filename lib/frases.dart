import 'package:flutter/material.dart';
import 'dart:math';

class Frase extends StatefulWidget {
  const Frase({Key? key}) : super(key: key);

  @override
  State<Frase> createState() => _FraseState();
}

class _FraseState extends State<Frase> {
  var frases = [
    "Nada pode ser tão ruim que não possa piorar",
    "Para baixo todo santo ajuda",
    "O caminho é longo, mas a derrota é certa",
    "Vamos esquecer os erros do passado e focar nos erros futuros"
  ];

  var fraseGerada = 'Clique abaixo para gerar uma frase';

  void _gerarFrases() {
    var numeroSorteado = Random().nextInt(frases.length);
    setState(() {
      fraseGerada = frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Text(
                fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              TextButton(
                  onPressed: _gerarFrases,
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Nova frase",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)))
            ],
          ),
        ),
      ),
    );
  }
}
