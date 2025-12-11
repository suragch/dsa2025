void main() {
  print('Original:');
  final myList = [6, 5, 4, 3, 2, 1];
  // final myList = [1, 2, 3, 4, 5, 6];
  print(myList);

  selectionSort(myList);
  print('Sorted:');
  print(myList);
}

void selectionSort(List<int> myList) {
  for (int start = 0; start < myList.length - 1; start++) {
    int smallest = start;
    for (int i = start; i < myList.length; i++) {
      if (myList[i] < myList[smallest]) {
        smallest = i;
      }
    }
    if (start != smallest) {
      _swap(myList, start, smallest);
    }
  }
}

void _swap(List<int> myList, int firstIndex, int secondIndex) {
  print('Swapping index $firstIndex with index $secondIndex');

  final tempValue = myList[firstIndex];
  myList[firstIndex] = myList[secondIndex];
  myList[secondIndex] = tempValue;
}
