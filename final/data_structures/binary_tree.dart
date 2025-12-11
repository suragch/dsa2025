class BinaryNode {
  int value;
  BinaryNode? leftChild;
  BinaryNode? rightChild;

  BinaryNode(this.value, {this.leftChild, this.rightChild});

  void travelPreOrder(void Function(int) action) {
    action(value);
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
  }

  void travelInOrder(void Function(int) action) {
    leftChild?.travelPreOrder(action);
    action(value);
    rightChild?.travelPreOrder(action);
  }

  void travelPostOrder(void Function(int) action) {
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
    action(value);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    _buildTree(buffer, '', true, true);
    return buffer.toString();
  }

  void _buildTree(
    StringBuffer buffer,
    String prefix,
    bool isTail,
    bool isRoot,
  ) {
    buffer.write(prefix);
    if (!isRoot) {
      buffer.write(isTail ? '└── ' : '├── ');
    }
    buffer.writeln(value);

    final children = <BinaryNode?>[
      leftChild,
      rightChild,
    ].where((child) => child != null).toList();
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final newPrefix = prefix + (isTail && !isRoot ? '    ' : '│   ');
      final isLastChild = i == children.length - 1;
      child?._buildTree(buffer, newPrefix, isLastChild, false);
    }
  }
}

class BinarySearchTree {
  BinaryNode? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  BinaryNode _insert(BinaryNode? node, int value) {
    if (node == null) {
      return BinaryNode(value);
    }

    if (value >= node.value) {
      node.rightChild = _insert(node.rightChild, value);
    } else {
      node.leftChild = _insert(node.leftChild, value);
    }

    return node;
  }

  bool contains(int value) {
    BinaryNode? current = root;

    while (current != null) {
      if (current.value == value) {
        return true;
      }
      if (value < current.value) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }

    return false;
  }

  void remove(int value) {
    root = _remove(root, value);
  }

  BinaryNode? _remove(BinaryNode? node, int value) {
    if (node == null) {
      return null;
    }
    if (value < node.value) {
      node.leftChild = _remove(node.leftChild, value);
    } else if (value > node.value) {
      node.rightChild = _remove(node.rightChild, value);
    } else {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      } else if (node.leftChild == null) {
        return node.rightChild;
      } else if (node.rightChild == null) {
        return node.leftChild;
      } else {
        BinaryNode minInRight = node.rightChild!;
        while (minInRight.leftChild != null) {
          minInRight = minInRight.leftChild!;
        }
        node.value = minInRight.value;
        node.rightChild = _remove(node.rightChild, minInRight.value);
      }
    }
    return node;
  }

  @override
  String toString() {
    return root.toString();
  }
}

void main() {
  final bst = BinarySearchTree();
  bst.insert(3);
  bst.insert(1);
  bst.insert(4);
  bst.insert(0);
  bst.insert(2);
  bst.insert(5);
  print(bst);

  print(bst.contains(2));
}

void action(int value) {
  print(value);
}
