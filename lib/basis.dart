void main() {
  Person person = Person(name: "John", age: 30);
  print(person.name);
  person = person.copyWith(name: 'David');
}

class Person {
  // final means immutable, cannot be changed after initialization
  final String name;
  final int age;
  Person({required this.name, required this.age});

  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
