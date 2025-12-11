import 'queue.dart';
import 'stack.dart';

class Edge<T> {
  final T destination;
  final int weight;
  Edge(this.destination, this.weight);

  @override
  String toString() {
    return '($destination, W:$weight)';
  }
}

class Graph<T> {
  final Map<T, List<Edge<T>>> _adjacencyList = {};
  final bool directed;
  Graph({this.directed = false});

  void addVertex(T vertex) {
    if (_adjacencyList.containsKey(vertex)) return;
    _adjacencyList[vertex] = [];
  }

  void addEdge(T source, T destination, {int weight = 1}) {
    // Create source and destination if they don't exist yet
    addVertex(source);
    addVertex(destination);

    bool exists = _adjacencyList[source]!.any(
      (edge) => edge.destination == destination,
    );

    // add an edge between source and destination
    if (!exists) {
      _adjacencyList[source]!.add(Edge(destination, weight));
    }

    // if this is an undirected graph, add edge from destination to source
    if (!directed) {
      bool reverseExists = _adjacencyList[destination]!.any(
        (edge) => edge.destination == source,
      );
      if (!reverseExists) {
        _adjacencyList[destination]!.add(Edge(source, weight));
      }
    }
  }

  void breadthFirstSearch(T startVertex) {
    // make the queue
    final queue = LinkedListQueue<T>();

    // keep track of all the visited vertices
    final visited = <T>{};

    // initialize queue
    queue.enqueue(startVertex);
    visited.add(startVertex);

    // keep going until the queue is empty
    while (!queue.isEmpty) {
      // dequeue the next item
      final current = queue.dequeue();
      if (current == null) break;

      _processVertex(current);

      // visit all the neighbors
      for (final neighbor in _adjacencyList[current]!) {
        if (!visited.contains(neighbor.destination)) {
          visited.add(neighbor.destination);
          queue.enqueue(neighbor.destination);
        }
      }
    }
  }

  void depthFirstSearch(T startVertex) {
    final stack = Stack<T>();
    final visited = <T>{};

    stack.push(startVertex);

    // Keep going as long as the stack is not empty
    while (!stack.isEmpty) {
      final current = stack.pop();
      if (current == null) break;

      // check if current is in visited
      if (visited.contains(current)) continue;

      // add current to visited
      visited.add(current);
      _processVertex(current);

      // add all of the neighbors to the stack
      final neighbors = _adjacencyList[current] ?? [];
      for (final edge in neighbors) {
        final neighbor = edge.destination;
        if (!visited.contains(neighbor)) {
          stack.push(neighbor);
        }
      }
    }
  }

  void _processVertex(T vertex) {
    print(vertex);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    _adjacencyList.forEach((vertex, edges) {
      String connections = edges
          .map((e) => '${e.destination}(${e.weight})')
          .join(', ');
      buffer.writeln('$vertex: $connections');
    });
    return buffer.toString();
  }
}

void main() {
  final myGraph = Graph();
  myGraph.addEdge('Alice', 'Bob');
  myGraph.addEdge('Alice', 'Charlie');
  myGraph.addEdge('Bob', 'Diana');

  print(myGraph);
}
