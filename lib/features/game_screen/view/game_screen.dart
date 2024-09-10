import 'package:flutter/material.dart';
import '../controllers/tile_controller.dart';
import '../widgets/tile_widget.dart';

class GameScreen extends StatefulWidget {
  final int gridSize;
  final int initialTime;

  GameScreen({required this.gridSize, required this.initialTime});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late TileController _controller;
  late int _timeLeft;

  @override
  void initState() {
    super.initState();
    _controller =
        TileController(gridSize: widget.gridSize, timeLeft: widget.initialTime);
    _timeLeft = widget.initialTime;

    _controller.startTimer((newTimeLeft) {
      setState(() {
        _timeLeft = newTimeLeft;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _resetGame() {
    setState(() {
      _controller.resetTiles();
      _timeLeft = widget.initialTime;
      _controller.startTimer((newTimeLeft) {
        setState(() {
          _timeLeft = newTimeLeft;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      appBar: AppBar(
        title: const Text('Tile Tap Game'),
        backgroundColor: Colors.orange[600],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[400],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Text(
                "Timer: ${_timeLeft ~/ 60}:${(_timeLeft % 60).toString().padLeft(2, '0')}",
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.gridSize,
              ),
              itemCount: _controller.tiles.length,
              itemBuilder: (context, index) {
                return TileWidget(
                  tile: _controller.tiles[index],
                  onTap: () {
                    setState(() {
                      _controller.onTileTap(index);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _resetGame,
              icon: const Icon(Icons.refresh, size: 28),
              label: const Text('Restart', style: TextStyle(fontSize: 22)),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
