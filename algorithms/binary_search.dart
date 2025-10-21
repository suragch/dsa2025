void main() {
  final myList = [2, 4, 8, 20, 23, 45, 66, 70, 81, 100];
  final searchValue = 20;
  final index = binarySearch(myList, searchValue);
  print('$searchValue at index $index');
}

int? binarySearch(List<int> list, int searchValue) {
  int low = 0;
  int high = list.length - 1;
  while (low <= high) {
    final middle = (low + high) ~/ 2;
    if (searchValue == list[middle]) {
      return middle;
    } else if (searchValue < list[middle]) {
      high = middle - 1;
    } else {
      low = middle + 1;
    }
  }
  return null;
}
