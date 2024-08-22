import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/app_theme.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const MyColors(
        defaultTextColor: Color(0xFFf2efea),
        playerOneColor: Color(0xFF66D7D1),
        playerTwoColor: Color(0xFFFC7753),
        bgColor: Color(0xFF232130),
        tileColor: Color(0xFF2c2a3c)),
  ],
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const MyColors(
        defaultTextColor: Color(0xFFf2efea),
        playerOneColor: Color(0xFF66D7D1),
        playerTwoColor: Color(0xFFFC7753),
        bgColor: Color.fromARGB(255, 238, 235, 255),
        tileColor: Color.fromARGB(255, 136, 127, 206)),
  ],
);
