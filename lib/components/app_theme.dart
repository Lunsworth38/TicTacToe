import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.defaultTextColor,
    required this.playerOneColor,
    required this.playerTwoColor,
    required this.bgColor,
    required this.tileColor,
  });

  final Color? defaultTextColor;
  final Color? playerOneColor;
  final Color? playerTwoColor;
  final Color? bgColor;
  final Color? tileColor;

  @override
  MyColors copyWith(
      {Color? defaultTextColor,
      Color? playerOneColor,
      Color? playerTwoColor,
      Color? bgColor,
      Color? tileColor}) {
    return MyColors(
      defaultTextColor: defaultTextColor ?? defaultTextColor,
      playerOneColor: playerOneColor ?? playerOneColor,
      playerTwoColor: playerTwoColor ?? playerTwoColor,
      bgColor: bgColor ?? bgColor,
      tileColor: tileColor ?? tileColor,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      defaultTextColor: Color.lerp(defaultTextColor, other.defaultTextColor, t),
      playerOneColor: Color.lerp(playerOneColor, other.playerOneColor, t),
      playerTwoColor: Color.lerp(playerTwoColor, other.playerTwoColor, t),
      bgColor: Color.lerp(bgColor, other.bgColor, t),
      tileColor: Color.lerp(tileColor, other.tileColor, t),
    );
  }
}
