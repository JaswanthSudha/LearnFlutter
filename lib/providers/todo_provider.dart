import 'package:flutter/foundation.dart';
import '../models/todo_item.dart';
import 'dart:math';

class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _items = [];
  List<TodoItem> get items => List.unmodifiable(_items);
  int get total => _items.length;
  int get completed => _items.where((e) => e.isCompleted).length;
  int get pending => total - completed;
  void addTodo(String title) {
    if (title.trim().isEmpty) return;
    _items.add(TodoItem(id: _generateId(), title: title));
    notifyListeners();
  }

  void toggle(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;
    _items[index].isCompleted = !_items[index].isCompleted;
    notifyListeners();
  }

  void delete(String id) {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void clearCompleted() {
    _items.removeWhere((e) => e.isCompleted);
    notifyListeners();
  }

  String _generateId() => Random().nextInt(1 << 32).toString();
}
