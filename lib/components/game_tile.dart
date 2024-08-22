import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/app_theme.dart';

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

  showSymbol(Color? playerOneColor, Color? playerTwoColor) {
    if (value == null) {
      return const Text(
        "",
      );
    }
    if (value == 1) {
      return Text("O",
          style: TextStyle(
              fontFamily: 'calibri', fontSize: 100, color: playerOneColor));
    }
    if (value == 2) {
      return Text("X",
          style: TextStyle(
              fontFamily: 'calibri', fontSize: 100, color: playerTwoColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MyColors? theme = Theme.of(context).extension<MyColors>();
    return GestureDetector(
        onTap: disabled ? null : onTap,
        child: Card(
          color: theme?.tileColor,
          child: Center(
              child: showSymbol(theme?.playerOneColor, theme?.playerTwoColor)),
        ));
  }
}
