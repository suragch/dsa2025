class Node {
  Node(this.value);
  final String value;
  final List<Node> children = [];

  void add(Node child) {
    children.add(child);
  }

  void depthFirstTraversal(void Function(Node) doAction) {
    doAction(this);
    for (final child in this.children) {
      child.depthFirstTraversal(doAction);
    }
  }
}

void main() {
  final tree = _buildTree();
  tree.depthFirstTraversal(_makeDrink);
}

void _makeDrink(Node myNode) {
  if (myNode.children.isNotEmpty) return;
  print('I am making ${myNode.value}.');
}

Node _buildTree() {
  final beverages = Node('beverages');
  final hot = Node('hot');
  final cold = Node('cold');
  final coffee = Node('coffee');
  final tea = Node('tea');
  final chocolate = Node('chocolate');
  final juice = Node('juice');
  final apple = Node('apple');
  final raspberry = Node('raspberry');
  final water = Node('water');

  beverages.add(hot);
  beverages.add(cold);
  hot.add(coffee);
  hot.add(tea);
  hot.add(chocolate);
  cold.add(juice);
  cold.add(water);
  juice.add(apple);
  juice.add(raspberry);

  return beverages;
}
