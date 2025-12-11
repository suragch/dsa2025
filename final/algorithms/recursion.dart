class Bunny {
  final String name;
  final List<Bunny> babies;

  Bunny({required this.name, required this.babies});
}

class Stack<T> {
  final _list = <T>[];

  bool get isEmpty => _list.isEmpty;

  void push(T value) {
    _list.add(value);
  }

  T? pop() {
    if (isEmpty) return null;
    return _list.removeLast();
  }
}

void printBunnyNameST(Bunny root) {
  final stack = Stack<Bunny>();
  stack.push(root);

  while (!stack.isEmpty) {
    final current = stack.pop();
    print(current?.name);
    for (var i = current!.babies.length - 1; i >= 0; i--) {
      stack.push(current.babies[i]);
    }
  }
}

void printBunnyName(Bunny bunny) {
  print(bunny.name);
  // base case
  if (bunny.babies.isEmpty) {
    return;
  }

  // recursive case
  for (final baby in bunny.babies) {
    printBunnyName(baby);
  }
}

final bunnyFamily = Bunny(
  name: 'mommy',
  babies: [
    Bunny(
      name: 'Happy',
      babies: [
        Bunny(name: 'Larry', babies: []),
        Bunny(name: 'Barry', babies: []),
      ],
    ),
    Bunny(
      name: 'Tappy',
      babies: [
        Bunny(name: 'Walt', babies: []),
        Bunny(name: 'Salt', babies: []),
        Bunny(name: 'Malt', babies: []),
      ],
    ),
    Bunny(
      name: 'Mappy',
      babies: [Bunny(name: 'Bob', babies: [])],
    ),
  ],
);
