import 'package:flutter/material.dart';

class Consumo extends StatefulWidget {
  const Consumo({super.key});
  _ConsumoState createState() => _ConsumoState();
}

class _ConsumoState extends State<Consumo> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _texto = "";

  void _calcular() {
    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null ||
        precoGasolina == null ||
        precoAlcool <= 0 ||
        precoGasolina <= 0) {
      setState(() {
        _texto = "Por favor, insira números válidos maiores que zero.";
      });
    } else {
      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _texto = "Compre Gasolina";
        });
      } else {
        setState(() {
          _texto = "Compre Álcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alcool ou Gasolina",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Image.asset("images/logo (1).png", height: 100)),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Saiba qual é a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço Alcool ex:4.99"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina ex:5.97"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: TextButton(
                      onPressed: () {
                        _calcular();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text("Calcular",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  _texto,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )));
  }
}
