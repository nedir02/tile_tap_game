import 'package:flutter/material.dart';

import '../../../repositories/models/models.dart';

class TileWidget extends StatelessWidget {
  final TileModel tile;
  final VoidCallback onTap;

  const TileWidget({super.key, required this.tile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tile.isClickable ? onTap : null,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: tile.isClickable ? Colors.green : Colors.teal,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            tile.number.toString(),
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
