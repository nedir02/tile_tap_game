import 'package:flutter/material.dart';

import 'features/game_screen/game_screen.dart';

void main() {
  runApp(const TileTapGameApp());
}

class TileTapGameApp extends StatelessWidget {
  const TileTapGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tile Tap Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LevelSelectionScreen(),
    );
  }
}

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  void startLevel(BuildContext context, int level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          gridSize: 3 + level,
          initialTime: 60 + 60 * level,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Level'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => startLevel(context, 1),
            child: const Text('Level 1'),
          ),
          ElevatedButton(
            onPressed: () => startLevel(context, 2),
            child: const Text('Level 2'),
          ),
          ElevatedButton(
            onPressed: () => startLevel(context, 3),
            child: const Text('Level 3'),
          ),
        ],
      ),
    );
  }
}
