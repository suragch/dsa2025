void main() {
  final myList = LinkedList();
  myList.addLast(42);
  myList.addLast(10);
  myList.addLast(3);
  print(myList); // 42 -> 10 -> 3

  myList.removeLast();
  print(myList); // 42 -> 10

  myList.addFirst(99);
  print(myList); // 99 -> 42 -> 10

  myList.removeFirst();
  print(myList); // 42 -> 10

  print('isEmpty: ${myList.isEmpty}'); // isEmpty: false
}

class Node {
  Node(this.value, [this.next]);

  int value;
  Node? next;
  Node? previous;

  @override
  String toString() {
    final result = StringBuffer();
    result.write(value);
    var nextNode = next;
    while (nextNode != null) {
      result.write(' -> ');
      result.write(nextNode.value);
      nextNode = nextNode.next;
    }
    return result.toString();
  }
}

class LinkedList {
  Node? head;
  Node? tail;

  void addLast(int value) {
    final newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      tail = newNode;
    }
  }

  void addFirst(int value) {
    final newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  int? removeFirst() {
    if (isEmpty) {
      throw Exception('The list is empty.');
    }

    final returnValue = head;
    head = head?.next;
    return returnValue?.value;
  }

  void removeLast() {
    if (isEmpty) {
      throw Exception('The list is empty.');
    }

    if (head == tail) {
      // one item in the list
      head = null;
      tail = null;
    } else {
      // many items in the list
      var current = head;
      while (current?.next != tail) {
        current = current?.next;
      }
      current?.next = null;
      tail = current;
    }
  }

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) {
      return 'Empty';
    }
    return head.toString();
  }
}
