class Todo {
  final String id;
  final String description;
  final DateTime? completedAt;

  Todo(
      {required this.id, required this.description, required this.completedAt});

  bool get done {
    return completedAt != null;
  }

  Todo copyWith({String? id, String? description, DateTime? completedAt}) =>
      Todo(
          completedAt: completedAt,
          description: description ?? this.description,
          id: id ?? this.id
          );
}
