import 'linked_list.dart';

class LinkedListQueue<T> {
  LinkedList<T> _data = LinkedList<T>();

  bool get isEmpty => _data.isEmpty;

  void enqueue(T value) {
    _data.addLast(value);
  }

  T? dequeue() {
    return _data.removeFirst();
  }

  @override
  String toString() {
    return _data.toString();
  }
}
