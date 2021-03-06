import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;

  Resposta(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(8.0),
        child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text(texto),
            onPressed: onSelect));
  }
}
