import 'dart:async';

import 'package:tile_tap_game/repositories/models/tile_model.dart';

class TileController {
  List<TileModel> tiles;
  int gridSize;
  late Timer timer;
  int timeLeft;

  TileController({required this.gridSize, required this.timeLeft})
      : tiles =
            List.generate(gridSize * gridSize, (index) => TileModel(number: 1));

  void startTimer(void Function(int) onTick) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
        onTick(timeLeft);
      } else {
        timer.cancel();
      }
    });
  }

  void onTileTap(int index) {
    if (tiles[index].isClickable) {
      tiles[index].increment();
    }
  }

  void resetTiles() {
    for (var tile in tiles) {
      tile.reset();
    }
  }

  void dispose() {
    timer.cancel();
  }
}
