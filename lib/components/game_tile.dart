import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final double? value;

  GameTile({required this.value, super.key});

  showSymbol() {
    if (value == null) {
      return const Text("");
    }
    if (value == 0) {
      return const Text("O");
    }
    if (value == 1) {
      return const Text("1");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      color: Colors.blue,
      child: showSymbol(),
    ));
  }
}
