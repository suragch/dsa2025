import 'linked_list.dart';

void main() {
  final myQueue = LinkedListQueue();
  myQueue.enqueue(42);
  myQueue.enqueue(10);
  myQueue.enqueue(3);
  print(myQueue); // 42 -> 10 -> 3

  final value = myQueue.dequeue();
  print('dequeued: $value');
  print(myQueue); // 10 -> 3

  myQueue.enqueue(99);
  print(myQueue);
}

class LinkedListQueue {
  LinkedList _data = LinkedList();

  bool get isEmpty => _data.isEmpty;

  void enqueue(int value) {
    _data.addLast(value);
  }

  int? dequeue() {
    return _data.removeFirst();
  }

  @override
  String toString() {
    return _data.toString();
  }
}
