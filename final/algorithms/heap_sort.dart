import 'dart:math';
import '../data_structures/heap.dart';

List<int> heapSort(List<int> list) {
  final List<int> result = [];

  final minHeap = Heap(isMax: false);
  for (int i = 0; i < list.length; i++) {
    final value = list[i];
    minHeap.insert(value);
  }

  while (minHeap.top != null) {
    result.add(minHeap.removeTop()!);
  }

  return result;
}

void main() {
  final myList = _aMillionRandomNumbers();

  final stopwatch = Stopwatch();
  stopwatch.start();

  final sortedList = heapSort(myList);

  stopwatch.stop();
  print('Time in milliseconds: ${stopwatch.elapsed.inMilliseconds}');
  print('Min: ${sortedList.first}');
  print('Max: ${sortedList.last}');
}

List<int> _aMillionRandomNumbers() {
  final random = Random();
  final List<int> result = [];
  for (int i = 0; i < 1000000; i++) {
    final number = random.nextInt(1000000);
    result.add(number);
  }
  return result;
}
