import 'package:flutter/material.dart';
import 'dart:math'; // Para gerar números aleatórios

class ParImparGame extends StatefulWidget {
  @override
  _ParImparGameState createState() => _ParImparGameState();
}

class _ParImparGameState extends State<ParImparGame> {
  final _random = Random();
  TextEditingController _controller = TextEditingController();
  String _message = '';
  int _userChoice = -1; // -1 indica que o usuário não fez uma escolha
  int _appChoice = -1;
  int _userNumber = 0;

  void _playGame() {
    // Verifica se o usuário digitou um número válido
    if (_userChoice == -1) {
      setState(() {
        _message = 'Por favor, escolha Par ou Ímpar!';
      });
      return;
    }

    try {
      // Obtém o número digitado pelo usuário
      _userNumber = int.parse(_controller.text);
      if (_userNumber < 0 || _userNumber > 9) {
        setState(() {
          _message = 'Digite um número entre 0 e 9!';
        });
        return;
      }
    } catch (e) {
      setState(() {
        _message = 'Digite um número válido!';
      });
      return;
    }

    // Gera um número aleatório para o app
    _appChoice = _random.nextInt(10); // Gera um número entre 0 e 9
    int sum = _userNumber + _appChoice;

    // Verifica se a soma é par ou ímpar
    bool isEven = sum % 2 == 0;
    bool userWins =
        (_userChoice == 0 && isEven) || (_userChoice == 1 && !isEven);

    setState(() {
      if (userWins) {
        _message = 'Você ganhou! A soma é ${sum} (${isEven ? 'Par' : 'Ímpar'})';
      } else {
        _message = 'Você perdeu! A soma é ${sum} (${isEven ? 'Par' : 'Ímpar'})';
      }
    });
  }

  void _setUserChoice(int choice) {
    setState(() {
      _userChoice = choice;
      _message = ''; // Limpar a mensagem anterior
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jogo Par ou Ímpar',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha Par ou Ímpar e digite seu número!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _setUserChoice(0), // 0 = Par
                  child: Text('Par'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _setUserChoice(1), // 1 = Ímpar
                  child: Text('Ímpar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu número (0 a 9)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _playGame,
              child: Text('Jogar'),
            ),
            SizedBox(height: 30),
            Text(
              _message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
