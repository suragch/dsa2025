void main() {
  final myList = [10, 80, 30, 40, 50, 70];
  print(myList);
  quicksort(myList);
  print(myList);
}

void quicksort(List<int> list) {
  _quicksort(list, 0, list.length - 1);
}

void _quicksort(List<int> list, int low, int high) {
  if (low >= high) return;
  final pivotIndex = _lomutoPartition(list, low, high);
  _quicksort(list, low, pivotIndex - 1);
  _quicksort(list, pivotIndex + 1, high);
}

int _lomutoPartition(List<int> list, int low, int high) {
  int pivot = list[high];
  int smaller = low - 1;
  for (int current = low; current < high; current++) {
    if (list[current] <= pivot) {
      smaller++;
      _swap(list, smaller, current);
    }
  }
  smaller++;
  _swap(list, smaller, high);
  return smaller;
}

void _swap(List<int> list, int indexA, int indexB) {
  if (indexA == indexB) return;
  final temp = list[indexA];
  list[indexA] = list[indexB];
  list[indexB] = temp;
}
