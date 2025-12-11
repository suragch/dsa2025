void main() {
  print('Original:');
  final myList = [6, 5, 4, 3, 2, 1];
  // final myList = [1, 2, 3, 4, 5, 6];
  print(myList);

  insertionSort(myList);
  print('Sorted:');
  print(myList);
}

void insertionSort(List<int> myList) {
  for (int i = 1; i < myList.length; i++) {
    for (int j = i; j >= 0; j--) {
      if (j != 0 && myList[j] < myList[j - 1]) {
        _swap(myList, j - 1, j);
      } else {
        continue;
      }
    }
  }
}

void _swap(List<int> myList, int firstIndex, int secondIndex) {
  print('Swapping index $firstIndex with index $secondIndex');

  final tempValue = myList[firstIndex];
  myList[firstIndex] = myList[secondIndex];
  myList[secondIndex] = tempValue;
}
