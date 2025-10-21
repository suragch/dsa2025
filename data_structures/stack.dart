void main() {
  final myStack = Stack();
  myStack.push(42);
  myStack.push(10);
  myStack.push(3);
  print(myStack);
}

class Stack {
  final List<int> _data = [];

  bool get isEmpty => _data.isEmpty;

  void push(int value) {
    _data.add(value);
  }

  int? pop() {
    if (isEmpty) return null;
    return _data.removeLast();
  }

  @override
  String toString() {
    return _data.toString();
  }
}
