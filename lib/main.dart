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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final tilesState = [null, null, null, null, null, null, null, null, null];
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 400,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                GameTile(value: widget.tilesState[0]),
                GameTile(value: widget.tilesState[1]),
                GameTile(value: widget.tilesState[2]),
              ],
            ),
            Row(
              children: [
                GameTile(value: widget.tilesState[3]),
                GameTile(value: widget.tilesState[4]),
                GameTile(value: widget.tilesState[5]),
              ],
            ),
            Row(
              children: [
                GameTile(value: widget.tilesState[6]),
                GameTile(value: widget.tilesState[7]),
                GameTile(value: widget.tilesState[8]),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
