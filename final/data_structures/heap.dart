class Heap {
  Heap({this.isMax = true});

  final bool isMax;

  final List<int> _data = [];

  int? get top {
    if (_data.isEmpty) return null;
    return _data[0];
  }

  void insert(int value) {
    _data.add(value);
    int childIndex = _data.length - 1;
    int parentIndex = (childIndex - 1) ~/ 2;
    while (childIndex > 0 && _firstIsExtreme(childIndex, parentIndex)) {
      _swap(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = (childIndex - 1) ~/ 2;
    }
  }

  // For a max heap this returns tree if the first index is greater.
  // For a min heap this return true if the first index is smaller.
  bool _firstIsExtreme(int childIndex, int parentIndex) {
    if (isMax) {
      return _data[childIndex] > _data[parentIndex];
    } else {
      return _data[childIndex] < _data[parentIndex];
    }
  }

  void _swap(int index1, index2) {
    final temp = _data[index1];
    _data[index1] = _data[index2];
    _data[index2] = temp;
  }

  int? removeTop() {
    if (_data.isEmpty) return null;
    if (_data.length == 1) return _data.removeLast();

    final top = _data[0];
    _data[0] = _data.removeLast();

    while (true) {
      final parentIndex = 0;
      final leftChildIndex = 2 * parentIndex + 1;
      final rightChildIndex = 2 * parentIndex + 2;
      int extremeIndex = parentIndex;

      // check left child
      if (leftChildIndex < _data.length &&
          _firstIsExtreme(leftChildIndex, extremeIndex)) {
        extremeIndex = leftChildIndex;
      }

      // check right child
      if (rightChildIndex < _data.length &&
          _firstIsExtreme(rightChildIndex, extremeIndex)) {
        extremeIndex = rightChildIndex;
      }

      if (extremeIndex != parentIndex) {
        _swap(extremeIndex, parentIndex);
      } else {
        break;
      }
    }

    return top;
  }

  @override
  String toString() => _data.toString();
}
