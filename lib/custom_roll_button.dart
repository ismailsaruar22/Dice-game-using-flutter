import 'package:dice_game/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollButton extends StatefulWidget {
  final String label;
  final Function onRollButtonPressed;

  const RollButton(this.label, {required this.onRollButtonPressed});

  @override
  _RollButtonState createState() => _RollButtonState();
}

class _RollButtonState extends State<RollButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onRollButtonPressed();

      },
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade900,
              blurRadius: 5,
              spreadRadius: 5,

            )
          ]
        ),
       child:  Text('ROLL', style: myStyle.copyWith(fontSize: 20, color: Colors.black),),
      ),
    );
  }
}
