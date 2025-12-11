void main() {
  final myList = [170, 45, 75, 802, 24, 2, 66];
  print(myList);
  radixSort(myList);
  print(myList); // [2, 24, 45, 66, 75, 170, 802]
}

void radixSort(List<int> list) {
  if (list.length <= 1) {
    return;
  }

  int place = 1;

  int biggestNumber = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > biggestNumber) {
      biggestNumber = list[i];
    }
  }
  final numberOfDigits = biggestNumber.toString().length;

  // loop for every place
  for (int i = 0; i < numberOfDigits; i++) {
    final buckets = List<List<int>>.generate(10, (_) => []);

    // loop through every number in the list
    for (int value in list) {
      final digit = (value ~/ place) % 10;
      buckets[digit].add(value);
    }

    list.clear();
    for (final bucket in buckets) {
      list.addAll(bucket);
    }

    place = place * 10;
  }
}
