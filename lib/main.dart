import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/app_theme.dart';
import 'package:tic_tac_toe/components/game_tile.dart';
import 'package:tic_tac_toe/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;

  void toggleTheme() {
    setState(() => isLightTheme = !isLightTheme);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIC TAC TOE',
      theme: isLightTheme ? lightTheme : darkTheme,
      home: MyHomePage(toggleTheme: toggleTheme, isLightTheme: isLightTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function toggleTheme;
  final bool isLightTheme;
  const MyHomePage(
      {super.key, required this.toggleTheme, required this.isLightTheme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int?> tilesState = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];
  int? currentPlayerTurn;
  List<int> winningRow = [];

  final row1 = [0, 1, 2];
  final row2 = [3, 4, 5];
  final row3 = [6, 7, 8];
  final col1 = [0, 3, 6];
  final col2 = [1, 4, 7];
  final col3 = [2, 5, 8];
  final diag1 = [0, 4, 8];
  final diag2 = [2, 4, 6];

  late final List<List<int>> rowsAndColumnsAndDiagonals = [
    row1,
    row2,
    row3,
    col1,
    col2,
    col3,
    diag1,
    diag2
  ];

  checkScore() {
    List<int> completeRow = rowsAndColumnsAndDiagonals.firstWhere(
        (r) =>
            r.every((e) => tilesState[e] != null) &&
            r.every((e) {
              return tilesState[e] == tilesState[r.first];
            }),
        orElse: () => []);

    setState(() {
      winningRow = completeRow;
    });
  }

  int nextPlayer(int? player) {
    if (player == 1) {
      return 2;
    }
    if (player == 2) {
      return 1;
    }
    return randomiseStartPlayer();
  }

  onTileTap(int index, int? player) {
    setState(() {
      tilesState[index] = player;
      currentPlayerTurn = nextPlayer(player);
    });
  }

  int randomiseStartPlayer() {
    return Random().nextInt(2) + 1;
  }

  @override
  void initState() {
    super.initState();
    currentPlayerTurn = randomiseStartPlayer();
  }

  void resetGame() {
    setState(() {
      tilesState = [null, null, null, null, null, null, null, null, null];
      currentPlayerTurn = randomiseStartPlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyColors? theme = Theme.of(context).extension<MyColors>();
    Color? playerColor(int? playerNumber) {
      if (playerNumber == 1) {
        return theme?.playerOneColor;
      }
      if (playerNumber == 2) {
        return theme?.playerTwoColor;
      }
      return null;
    }

    checkScore();

    return Scaffold(
        backgroundColor: theme?.bgColor,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 60, 12, 0),
            child: Column(children: [
              OutlinedButton(
                  onPressed: () => widget.toggleTheme(),
                  child: Text(
                      "switch to ${widget.isLightTheme ? "dark theme" : "lightTheme"}")),
              const SizedBox(height: 68),
              if (winningRow.isNotEmpty)
                Text("Player ${tilesState[winningRow.first]} wins!",
                    style: TextStyle(
                        fontSize: 46,
                        color: playerColor(tilesState[winningRow.first]))),
              if (!tilesState.contains(null) && winningRow.isEmpty) ...[
                Text(
                  "Its a draw",
                  style:
                      TextStyle(fontSize: 60, color: theme?.defaultTextColor),
                ),
              ] else if (winningRow.isEmpty)
                Text(
                  "It is Player $currentPlayerTurn's turn!",
                  style: TextStyle(
                      fontSize: 46, color: playerColor(currentPlayerTurn)),
                ),
              Center(
                child: GridView.builder(
                  itemCount: tilesState.length,
                  itemBuilder: (context, index) => GameTile(
                      value: tilesState[index],
                      onTap: () => onTileTap(index, currentPlayerTurn),
                      disabled: winningRow.isNotEmpty),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ),
              const SizedBox(height: 68),
              OutlinedButton(
                  onPressed: () => resetGame(), child: const Text("New Game")),
            ])));
  }
}
