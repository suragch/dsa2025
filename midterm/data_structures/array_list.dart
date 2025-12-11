import 'dart:typed_data';

void main() {
  final myList = ArrayList();
  myList.add(42);
  myList.add(10);
  myList.add(3);
  print(myList); // [42, 10, 3]

  myList.removeLast();
  print(myList); // [42, 10]

  myList.insert(value: 99, index: 1);
  print(myList); // [42, 99, 10]

  myList.removeAt(0);
  print(myList); // [99, 10]

  myList.clear();
  print(myList); // []

  // force resize
  myList.add(1);
  myList.add(2);
  myList.add(3);
  myList.add(4);
  myList.add(5);
  myList.add(6);
  myList.add(7);
  myList.add(8);
  myList.add(9);
  print('Length: ${myList.length}'); // Length: 9
}

class ArrayList {
  late Uint8List _data;
  int _capacity = 8;

  int length = 0;

  ArrayList() {
    _data = Uint8List(_capacity);
  }

  void add(int value) {
    _resizeIfNeeded();
    _data[length] = value;
    length = length + 1;
  }

  void _resizeIfNeeded() {
    if (length >= _capacity) {
      _capacity *= 2;
      final newData = Uint8List(_capacity);
      newData.setRange(0, length, _data);
      _data = newData;
    }
  }

  void removeLast() {
    if (length == 0) return;
    _data[length - 1] = 0;
    length = length - 1;
  }

  void removeAt(int index) {
    for (int i = index; i < length - 1; i++) {
      _data[i] = _data[i + 1];
    }
    _data[length - 1] = 0;
    length--;
  }

  void clear() {
    for (int i = 0; i < length; i++) {
      _data[i] = 0;
    }
    length = 0;
  }

  void insert({required int value, required int index}) {
    _resizeIfNeeded();
    int start = length;
    for (int i = start; i > index; i = i - 1) {
      _data[i] = _data[i - 1];
    }
    _data[index] = value;
    length++;
  }

  int operator [](int index) {
    return _data[index];
  }

  void operator []=(int index, int value) {
    _data[index] = value;
  }

  @override
  String toString() {
    final result = StringBuffer();
    result.write('[');
    for (int i = 0; i < length; i++) {
      result.write(_data[i]);
      if (i < length - 1) {
        result.write(', ');
      }
    }
    result.write(']');
    return result.toString();
  }
}
