// ignore_for_file: file_names, use_key_in_widget_constructors

import 'dart:math';

import 'package:dice_game/custom_roll_button.dart';
import 'package:dice_game/custom_text_style.dart';
import 'package:flutter/material.dart';

class DiceGamePage extends StatefulWidget {
  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  final diceList = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];

  final random = Random.secure();

  var _index1 = 0;
  var _index2 = 0;
  var _score = 0;
  var _highestScore = 0;
  var _diceFaceSum = 0;
  var isGameOver = false;
  var _playerCount = 1;
  var _playerCount2 = 1;
  var _score1 = 0;
  var _score2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
      ),
      body: ListView(
        children: [
          Text(
            'Score: $_score',
            style: myStyle.copyWith(
              fontSize: 60,
            ),
          ),
          Text(
            'Highest Score: $_highestScore',
            style: myStyle.copyWith(
              color: Colors.red.shade900,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Image.asset(
                        diceList[_index1],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Image.asset(
                        diceList[_index2],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ]),
            ),
          ),
          Text(
            'Game will end at 9',
            style: myStyle.copyWith(fontSize: 20, color: Colors.green.shade900),
          ),
          Text(
            'Score: $_diceFaceSum',
            style: myStyle,
          ),
          if (isGameOver)
            Center(
              child: Text(
                'Game Over',
                style: myStyle.copyWith(
                  color: Colors.red.shade800,
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isGameOver)
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 100, 5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _playAgain,
                      child: const Text('Play Again'),
                    ),
                  ),
                ),
              if (isGameOver)
                Center(
                  child: ElevatedButton(
                    onPressed: _resetTheDice,
                    child: const Text('Reset'),
                  ),
                ),
            ],
          ),
          if (!isGameOver)
            Center(
              child: RollButton(
                'Roll Out',
                onRollButtonPressed: _rollTheDice,
              ),
            ),
        ],
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      _index1 = random.nextInt(6);
      _index2 = random.nextInt(6);
      _diceFaceSum = _index1 + _index2 + 2;
      if (_diceFaceSum == 9) {
        isGameOver = true;
      } else if (_playerCount == 1) {
        _score += _diceFaceSum;
        _score1 = _diceFaceSum;
        _playerCount++;
        print(_playerCount);
      } else if (_playerCount == 2) {
        _score += _diceFaceSum;
        _score2 = _diceFaceSum;
        print(_playerCount);
      }
      if (_score >= _highestScore) {
        _highestScore = _score;
      }
    });
  }

  void _resetTheDice() {
    setState(() {});
    _index1 = 0;
    _index2 = 0;
    _score = 0;
    _diceFaceSum = 0;
    _highestScore = 0;
    isGameOver = false;
  }

  void _playAgain() {
    setState(() {
      _score = 0;
      _index1 = 0;
      _index2 = 0;
      _diceFaceSum = 0;
      isGameOver = false;
    });
  }
}
