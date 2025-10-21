void main() {
  print('Original:');
  final myList = [6, 5, 4, 3, 2, 1];
  // final myList = [1, 2, 3, 4, 5, 6];
  print(myList);

  bubbleSort(myList);
  print('Sorted:');
  print(myList);
}

void bubbleSort(List<int> myList) {
  for (int end = myList.length - 1; end > 0; end--) {
    bool swapped = false;
    for (int i = 0; i < end; i++) {
      if (myList[i] > myList[i + 1]) {
        _swap(myList, i, i + 1);
        swapped = true;
      }
    }
    if (!swapped) {
      break;
    }
  }
}

void _swap(List<int> myList, int firstIndex, int secondIndex) {
  print('Swapping index $firstIndex with index $secondIndex');

  final tempValue = myList[firstIndex];
  myList[firstIndex] = myList[secondIndex];
  myList[secondIndex] = tempValue;
}
