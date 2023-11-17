import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:riverpod_recursos_nativos/config/config.dart';
import 'package:riverpod_recursos_nativos/domain/domain.dart';

const _uuid = Uuid();

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now())
        ]);

  void addTodo() {
    state = [
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      ...state
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) {
        return todo;
      }
      if (todo.done) {
        print(todo.id);
        return todo.copyWith(completedAt: null);
      }
      print(todo.completedAt);

      return todo.copyWith(completedAt: DateTime.now());
    }).toList();

   // state = [];
  }
}
