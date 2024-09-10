class TileModel {
  TileModel({required this.number, this.isClickable = true});
  int number;
  bool isClickable;

  void increment() {
    number = number < 5 ? number + 1 : 1;
  }

  void reset() {
    number = 1;
  }
}
