void main() {
  final students = HashTable();
  students.insert(Student(2024078, 'AZ1'));
  students.insert(Student(2024077, 'AZ2'));
  students.insert(Student(2021018, 'AD'));
  students.insert(Student(2023139, 'BB'));
  students.insert(Student(2025068, 'BS'));
  students.insert(Student(2024008, 'DD'));
  students.insert(Student(2024095, 'ES1'));
  students.insert(Student(2024012, 'ED1'));
  students.insert(Student(2024054, 'EB'));
  students.insert(Student(2024081, 'ED2'));
  students.insert(Student(2024111, 'ES2'));
  students.insert(Student(2024059, 'MI'));
  students.insert(Student(2024025, 'MB'));
  students.insert(Student(2024020, 'MC'));
  students.insert(Student(2023002, 'NM'));
  students.insert(Student(2022081, 'TG'));
  students.insert(Student(2024085, 'TK'));
  students.insert(Student(2023096, 'TA'));
  students.insert(Student(2022007, 'UM'));
  students.insert(Student(2024007, 'VG'));

  final studentName = students.getStudent(2024007);
  print(studentName);

  // Built-in hash tables (hash map) in Dart

  Map<int, String> idToNameMap = {
    2024078: 'AZ1',
    2024077: 'AZ2',
    2021018: 'AD',
  };

  final name = idToNameMap[2021018];
  print(name);

  Map<String, int> nameToIdMap = {
    'AZ1': 2024078,
    'AZ2': 2024077,
    'AD': 2021018,
  };

  final id = nameToIdMap['AZ1'];
  print(id);
}

class Student {
  final int id;
  final String name;

  Student(this.id, this.name);

  @override
  String toString() => '[$id] $name';
}

class HashTable {
  final _bucket = List<List<Student>>.generate(100, (_) => []);

  void insert(Student student) {
    final index = _hash(student.id);
    _bucket[index].add(student);
  }

  int _hash(int studentId) {
    return studentId % 100;
  }

  Student? getStudent(int studentId) {
    final index = _hash(studentId);
    final studentsAtIndex = _bucket[index];
    for (final student in studentsAtIndex) {
      if (student.id == studentId) {
        return student;
      }
    }
    return null;
  }
}
