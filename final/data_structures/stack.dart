class Stack<T> {
  final List<T> _data = [];

  bool get isEmpty => _data.isEmpty;

  void push(T value) {
    _data.add(value);
  }

  T? pop() {
    if (isEmpty) return null;
    return _data.removeLast();
  }

  @override
  String toString() {
    return _data.toString();
  }
}
