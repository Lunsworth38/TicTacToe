import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/game_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
  int currentPlayerTurn = 1;
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
              print("first ${r.first}");
              return tilesState[e] == tilesState[r.first];
            }),
        orElse: () => []);

    setState(() {
      winningRow = completeRow;
    });
  }

  onTileTap(index, player) {
    int nextPlayer() {
      if (player == 1) {
        return 2;
      }
      if (player == 2) {
        return 1;
      }
      throw Error();
    }

    setState(() {
      tilesState[index] = player;
      currentPlayerTurn = nextPlayer();
    });
  }

  playerColor() {
    if (currentPlayerTurn == 1) {
      return const Color(0xFF66D7D1);
    }
    if (currentPlayerTurn == 2) {
      return const Color(0xFFFC7753);
    }
    throw Error();
  }

  @override
  Widget build(BuildContext context) {
    checkScore();
    print(currentPlayerTurn);
    print(tilesState);
    print(winningRow);

    return Scaffold(
        backgroundColor: const Color(0xFF232130),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              const SizedBox(height: 68),
              if (winningRow.isNotEmpty)
                const Text("Game Over",
                    style: TextStyle(fontSize: 80, color: Color(0xFFF2EFEA))),
              if (winningRow.isEmpty)
                Text(
                  "It is Player $currentPlayerTurn's turn!",
                  style: TextStyle(fontSize: 60, color: playerColor()),
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
              )
            ])));
  }
}
