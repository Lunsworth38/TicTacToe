import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final int? value;
  final Function() onTap;
  final bool disabled;

  const GameTile({
    required this.value,
    required this.onTap,
    required this.disabled,
    super.key,
  });

  showSymbol() {
    if (value == null) {
      return const Text(
        "",
      );
    }
    if (value == 1) {
      return const Text("O",
          style: TextStyle(
              fontFamily: 'calibri', fontSize: 100, color: Color(0xFF66D7D1)));
    }
    if (value == 2) {
      return const Text("X",
          style: TextStyle(
              fontFamily: 'calibri', fontSize: 100, color: Color(0xFFFC7753)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: disabled ? null : onTap,
        child: Card(
          color: const Color(0xFF2c2a3c),
          child: Center(child: showSymbol()),
        ));
  }
}
