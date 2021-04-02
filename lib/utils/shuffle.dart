import 'dart:math';

List<int> shuffle(List<int> items) {
  var random = new Random();

  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}